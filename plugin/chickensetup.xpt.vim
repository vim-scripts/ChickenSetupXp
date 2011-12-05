XPTemplate priority=personal

let s:f = g:XPTfuncs()

fun! s:f.build_choice( choices )
    let s:choice = s:f.Build( ( a:choices )[ s:f.V() ] )
    return s:choice
endfunction

fun! s:f.include_choice( choices )
    let s:choice = s:f.Build( '`:' . ( ( a:choices )[ s:f.V() ] ) . ':^' )
    return s:choice
endfunction

XPTvar $TRUE          1
XPTvar $FALSE         0
XPTvar $NULL          NULL
XPTvar $UNDEFINED     NULL
XPTvar $VOID_LINE     /* void */;
XPTvar $BRif \n

XPTinclude
      \ _common/common
      \ _condition/lisp.like


XPT setup
; These two instructions will produce statically and dynamically linkable object files "`name^.o" and "`name^.so" respectively.
(compile `-s -O2 -d1^ `name^.scm -j `name^)
(compile -s `name^.import.scm -O2 -d0)
(compile `-c -O2 -d1^ `name^.scm -unit `name^ -j `name^)
;
(install-extension
  ; Name of your extension:
  '`name^
  ; Files to install for your extension:
  '("`name^.o" "`name^.so" "`name^.import.so")
  ; Assoc list with properties for your extension:
  '((version `number^)
    (static "`name^.o"))) ;; for static linking

..XPT

XPT _forms hidden
` `more...^` `FORM^` `more...^

XPT _ids hidden
`ID^` `more...^` `ID^` `more...^

XPT _infolist hidden
  ; Assoc list with properties for your extension:
  '(`:_symbol-value:^`
    `more...^`
    `:_symbol-value:^`
    `more...^)

XPT _id-filelist-infolist hidden
  ; Name of your extension:
  '`name^
  ; Files to install for your extension:
  '("`name^.o" "`name^.so" "`name^.import.so")
`  `infolist...^

XPT _symbol-value hidden
(`symbol^ `value^)

XPT compile " (compile FORM ...)
(compile `FORM^`:_forms:^)

XPT copy-file " (copy-file FROM TO)
(copy-file `FROM^ `TO^)

XPT create-directory/parents " (create-directory/parents PATH)
(create-directory/parents `PATH^)

XPT extension-name-and-version " extension-name-and-version
extension-name-and-version

XPT find-header " (find-header NAME)
(find-header `NAME^)

XPT find-library " (find-library NAME PROC)
(find-library `NAME^ `PROC^)

XPT host-extension
host-extension

XPT import-only " (import-only)
(import-only)

XPT install-extension
(install-extension
`:_id-filelist-infolist:^)

XSETm infolist...|post
`:_infolist:^
XSETm END

XPT install-program
(install-program
`:_id-filelist-infolist:^)

XSETm infolist...|post
`:_infolist:^
XSETm END

XPT install-script
(install-script
`:_id-filelist-infolist:^)

XSETm infolist...|post
`:_infolist:^
XSETm END

XPT installation-prefix " (installation-prefix)
(installation-prefix)

XPT _make_commands hidden
` `commands...^` `COMMAND^` `commands...^

XPT _make_dependents hidden
` `dependents...^` `DEPENDENT^` `dependents...^

XPT _make_commands2 hidden
` `more_commands...^` `COMMAND^` `more_commands...^

XPT _make_dependents2 hidden
` `more_dependents...^` `DEPENDENT^` `more_dependents...^

XPT _make_target hidden
(`TARGET^ (`DEPENDENT^`:_make_dependents:^) `COMMAND^`:_make_commands:^)

XPT _make_target2 hidden
(`TARGET^ (`DEPENDENT^`:_make_dependents2:^) `COMMAND^`:_make_commands2:^)

XPT _make_targets hidden
` `more_targets...^` `:_make_target2:^` `more_targets...^

XPT make " (make ((TARGET (DEPENDENT ...) COMMAND ...) ...) ARGUMENTS)
(make (`:_make_target:^`:_make_targets:^) `ARGUMENTS^)

XPT move-file " (move-file FROM TO)
(move-file `FROM^ `TO^)

XPT patch " (patch WHICH REGEX SUBST)
(patch `WHICH^ `REGEX^ `SUBST^)

XPT program-path " (program-path [PATH])
(program-path` `[PATH]^)

XPT remove-file " (remove-file* PATH)
(remove-file* `PATH^)

XPT require-at-runtime " (require-at-runtime ID ...)
(require-at-runtime `:_ids:^)

XPT run " (run FORM ...)
(run `FORM^`:_forms:^)

XPT setup-install-mode " (setup-install-mode [BOOL])
(setup-install-mode `[BOOL]^)

XPT setup-root-directory " (setup-root-directory [PATH])
(setup-root-directory` `[PATH]^)

XPT standard-extension " (standard-extension ID [VERSION] #!key info)
(standard-extension `ID^` `[VERSION]^` `info^)

XPT syntax " (syntax)
(syntax)

XPT try-compile " (try-compile CODE #!key cc cflags ldflags compile-only c++)
(try-compile `CODE^ `keys^` `more...^` `keys^` `more...^)
XSET keys=ChooseStr( 'cc', 'cflags', 'ldflags', 'compile-only', 'c++' )

XPT version " (version STRING)
(version `STRING^)

XPT version>=? " (version>=? V1 V2)
(version>=? `V1^ `V2^)
