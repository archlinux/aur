# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>
# Contributor: Dr-Shadow <kerdiles.robin@gmail.com>

pkgname=mingw-w64-python
pkgver=3.9.7
_pybasever=3.9
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language (mingw-w64)"
arch=('any')
license=('PSF')
url="https://www.python.org/"
depends=('mingw-w64-crt'
         'mingw-w64-expat'
         'mingw-w64-bzip2'
         'mingw-w64-libffi'
         'mingw-w64-ncurses'
         'mingw-w64-openssl'
         'mingw-w64-readline'
         'mingw-w64-tcl'
         'mingw-w64-tk'
         'mingw-w64-zlib'
         'mingw-w64-xz'
         'mingw-w64-mpdecimal'
         'mingw-w64-sqlite'
		 'mingw-w64-tzdata')

makedepends=('mingw-w64-configure' 'mingw-w64-wine' 'python' 'autoconf-archive')
optdepends=('mingw-w64-wine: runtime support')
options=('staticlibs' '!buildflags' '!strip')
source=("https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        0001-sysconfig-make-_sysconfigdata.py-relocatable.patch
        0002-restore-setup-config.patch
        0003-build-add-with-nt-threads-and-make-it-default-on-min.patch
        0004-MINGW-translate-gcc-internal-defines-to-python-platf.patch
        0005-MINGW-configure-MACHDEP-and-platform-for-build.patch
        0006-MINGW-preset-configure-defaults.patch
        0007-MINGW-configure-largefile-support-for-windows-builds.patch
        0008-MINGW-add-srcdir-PC-to-CPPFLAGS.patch
        0009-MINGW-init-system-calls.patch
        0010-MINGW-build-in-windows-modules-winreg.patch
        0011-MINGW-determine-if-pwdmodule-should-be-used.patch
        0012-issue6672-v2-Add-Mingw-recognition-to-pyport.h-to-al.patch
        0013-MINGW-configure-for-shared-build.patch
        0014-MINGW-dynamic-loading-support.patch
        0015-MINGW-ignore-main-program-for-frozen-scripts.patch
        0016-MINGW-setup-_multiprocessing-module.patch
        0017-MINGW-setup-select-module.patch
        0018-MINGW-setup-_ctypes-module-with-system-libffi.patch
        0019-MINGW-defect-winsock2-and-setup-_socket-module.patch
        0020-MINGW-exclude-unix-only-modules.patch
        0021-MINGW-setup-msvcrt-and-_winapi-modules.patch
        0022-sysconfig-MINGW-build-extensions-with-GCC.patch
        0023-MINGW-setup-_ssl-module.patch
        0024-MINGW-generalization-of-posix-build-in-sysconfig.py.patch
        0025-MINGW-support-stdcall-without-underscore.patch
        0026-use-replace-instead-rename-to-avoid-failure-on-windo.patch
        0027-MINGW-customize-site.patch
        0028-add-python-config-sh.patch
        0029-cross-darwin-feature.patch
        0030-mingw-system-libffi.patch
        0031-msys-mingw-prefer-unix-sep-if-MSYSTEM.patch
        0032-mingw-use-posix-getpath.patch
        0033-mingw-add-ModuleFileName-dir-to-PATH.patch
        0034-mingw-add-BUILDIN_WIN32_MODULEs-time-msvcrt.patch
        0035-msys-cygwin-semi-native-build-sysconfig.patch
        0036-sysconfig-mingw-sysconfig-like-posix.patch
        0037-build-_winapi-earlier-so-we-can-use-it-in-distutils-.patch
        0038-cross-dont-add-multiarch-paths-if-cross-compiling.patch
        0039-mingw-use-backslashes-in-compileall-py.patch
        0040-msys-convert_path-fix-and-root-hack.patch
        0041-allow-static-tcltk.patch
        0042-mingw-pdcurses_ISPAD.patch
        0043-grammar-fixes.patch
        0044-builddir-fixes.patch
        0045-msys-monkeypatch-os-system-via-sh-exe.patch
        0046-msys-replace-slashes-used-in-io-redirection.patch
        0047-remove_path_max.default.patch
        0048-dont-link-with-gettext.patch
        0049-ctypes-python-dll.patch
        0050-gdbm-module-includes.patch
        0051-use-gnu_printf-in-format.patch
        0052-mingw-fix-ssl-dont-use-enum_certificates.patch
        0053-fix-using-dllhandle-and-winver-mingw.patch
        0054-Add-AMD64-to-sys-config-so-msvccompiler-get_build_ve.patch
        0055-MINGW-link-with-additional-library.patch
        0056-install-msilib.patch
        0057-fix-signal-module-build.patch
        0058-build-build-winconsoleio-and-_testconsole.patch
        0059-expose-sem_unlink.patch
        0060-cygpty-isatty.patch
        0061-disable-broken-gdbm-module.patch
        0062-build-link-win-resource-files-and-build-pythonw.patch
        0063-3.7-mpdec-mingw.patch
        0064-disable-readline.patch
        0065-fix-isselectable.patch
        0066-use-_wcsnicmp-instead-wcsncasecmp.patch
        0067-_xxsubinterpretersmodule.patch
        0068-sqlite3-module-defines.patch
        0069-configure.ac-fix-inet_pton-check.patch
        0070-set-venv-activate-path-unix.patch
        0071-venv-creation-fixes.patch
        0072-pass-gen-profile-ldflags.patch
        0073-pkg-config-windows-must-link-ext-with-python-lib.patch
        0074-importlib-bootstrap-path-sep.patch
        0075-pathlib-path-sep.patch
        0076-warnings-fixes.patch
        0077-fix-build-testinternalcapi.patch
        0078-extend-MS_WINDOWS-flag.patch
        0079-clang-arm64.patch
        0080-configure.ac-set-MINGW-stack-reserve.patch
        0081-Don-t-use-os.pathsep-to-find-EOF.patch
        0082-Fix-extension-suffix-for-c-extensions-on-mingw.patch
        0083-Change-the-get_platform-method-in-sysconfig.patch
        0084-distutils-compiler-customize-mingw-cygwin-compilers.patch
        0085-distutils-compiler-enable-new-dtags.patch
        0086-distutils-MINGW-build-extensions-with-GCC.patch
        0087-distutils-use-Mingw32CCompiler-as-default-compiler-f.patch
        0088-distutils-find-import-library.patch
        0089-distutils-avoid-circular-dependency-from-time-module.patch
        0090-distutils-generalization-of-posix-build-in-distutils.patch
        0091-distutils-mingw-sysconfig-like-posix.patch
        0092-distutils-get_versions-fixes.patch
        0093-distutils-install-layout-as-posix.patch
        0094-distutils-msys-convert_path-fix-and-root-hack.patch
        0095-distutils-mingw-build-optimized-ext.patch
        0096-distutils-cygwinccompiler-dont-strip-modules-if-pyde.patch
        0097-distutils-get-compilers-from-env-vars.patch
        0098-distutils-add-windmc-to-cygwinccompiler.patch
        0099-distutils-fix-msvc9-import.patch
        0100-distutils-mingw-add-LIBPL-to-library-dirs.patch
        0101-distutils-Change-the-get_platform-method-in-distutil.patch
        0102-build-Fix-ncursesw-include-lookup.patch
        0103-tests-fix-test_bytes.patch
        0104-time-fix-strftime-not-raising-for-invalid-year-value.patch
        0105-ctypes-find_library-c-should-return-None-with-ucrt.patch
        0106-build-Disable-checks-for-dlopen-dlfcn.patch
        0107-Fix-install-location-of-the-import-library.patch
        0108-Set-MSYS2_ARG_CONV_EXCL-for-the-shared-Python-module.patch
        0109-build-Integrate-venvlauncher-build-installation-into.patch
        0110-configure.ac-set-_WIN32_WINNT-version.patch
        0111-configure.ac-don-t-check-for-clock_-functions.patch
        0112-expanduser-normpath-paths-coming-from-env-vars.patch
        0113-Add-support-for-Windows-7-Python-3.9.patch
        0114-Commit-regenerated-importlib.patch
        0115-CI-test-the-build-and-add-some-mingw-specific-tests.patch
        0116-decimal-backport-build-fixes.patch
        0117-smoketests-test-that-_decimal-exists.patch
        "wine-python.sh")
sha512sums=('55139776ab58a40f9e1e70613d7071d559ef9e51e32a77791422aac134322c21a49f0348c42813214b69789c589367eae43e16d4ae838a73daf37617e966b735'
			'f0cfb67ba0127995074990c71ff9dd8a722fcb89c8f6ec700f35fd5de749dfaea2c4794613fb5b2e0c13b8cd4a82bc26f067b577a3e5a74a60914b14b4c872a7'
			'26e51df2c56e3cb221841dfbe97e0110bd4aef17dc223992271a6217e4a716e0b67ff88f8bb8757c2a0e197cae5725dafbb87dd474d46882507d6e9c23a6ead4'
			'41c6f727660051ea03866d6afa4e799c611a6cce3f1d4765de28e6066c13d0ea1ed7f1d579d80b641df2819cf7c53b736a13be6e5bb5f5c52607422eeb8201e3'
			'6c56e0b11105d642c2b34b29f64a636471d74d4cfa319cf057e7149bb89068519c9941b4fb9a979480f250fae720b18b849c62cbce9671d690f207c1d4e52aa4'
			'8e7b12a59ddd91b73c88e8f4936d382faeac90b9ce915e1f32efafe48ffe217c5abbb834966779e601ae74a1116832a7ca8b383337a76e2c525cbf406e7e601f'
			'03a6449306e2332b439b2b8b8fa8176f0754351c1d773ae54ad940c975b8d8033f77b6cede17230f9a80d31715540fe0ca22a01dc517dc6fcfc18f937df11284'
			'5ac61ffaacf9d31c1c24691b3b7cf5b89df176a2e4e7ad303c9df4a06998a264cdb6ece7374a56abb914558513a553f63980ac6a34bde11919718d57695a4358'
			'b2d3616cb006995f3ace570ac8fbd203ce73aa91a7c25507eb5af887256500bf0a1d792e24d562db5995ef968d9c624b2bbbd6222d848f20b342e2437ba2c2a0'
			'c97011cdf741b22953493e7f5bd7cccbebaea2d77b0696c6fd54027d5b3670922da14015674d5a9c92c92e7df9f635ca5cc9ffed5da3329eb1886727d7970e30'
			'23c24a2f277d57e330659c26ce3e0e76aea619a6dcc726228c7d6592a5b1c5aa61dc4c7f55c6d289f0cbbfdc75f8b1a143fcd6aa8d197e9d9c7c5bab126a8a42'
			'19231e5e5f19bc3eb921ba7272c4f6e867ad19f94259e16a884ab755bdae8da6ef35274f360552c72e8b41bff14e75a89efe6908567b1d8f32832caed5888864'
			'1b80d9b88ed5f80587e0e182b19d3581ed6a4671e5b6ce78df2c9a2c7eb48e329bcc60b1fe6f29297b5cc537867fdd54c0444c1ee53986d400de4d2f7daa573a'
			'63eb5f4e3e48919be6630d8732a40349577c7924b4ddaf669931ddea89f5c88f56523ad24f16df03669325dc538a1b2b6f271f0858fb5b3b2e6c0d07262c1e52'
			'b6d15b8d3c9f2e6b45b0f41657e30ed8b4454a65c1b4395c178d56c1050ccb7c853ecbaca8ba0db24990e5c3264fbfe91529e5daf69b725b9a19ff891413c514'
			'cf864b7292a0e34622f532e536eba88358f9be290b3924396730d617c84d440b8f82557766cde336f9ef24f4bee47fea198fc8f6dd06ed8d0eba66b261ab87a3'
			'8196a95a830360c10d8c92ce905a12872fde802de83d1a1182cce91da3c8fa6792b99e26b57cfb6fd8687cfec6c5f71733363a6a14a1e223211b7355a5b30e20'
			'8351e50886702b7798ed153e2b90349ecfc62e32d5f223b10d95574fd0bdf3e2ce283f7b765005cd689f6a488f9cd26adf7c815508159f447b1cad7d6d1cebed'
			'd321ddc7e003c9a21185283a36eb719ce54973faaf822b43e88f33a9dc64382d57b98d5068d0ef2fec5c2fbde825ab5c1d006eef5610a9b5fdfb2355a605d013'
			'6ab2fb94b45d9931f3ee7e1323526760f21882432f546fb9d3e04216ddf99434da6596d8cdbdfdf46d07ea7a6e2a03691e1122c49f9462bb9bbc62b10a634043'
			'3d54eec19d4d875d792ddc100d5d90c070b485d5b46365411b618db891d7eb979d7edf23809d25559bfd46a1a989ebbd3e811d5f33f72547cc7892711440138f'
			'5f6edb6019a1632e36310aa03f8ba5884909a464130eea4fc3fb2b51cd1272eb6fb5d32d72abee22cb1193a8d01d0e9b4e5f831ace4eee3843aa47ac3520dc2b'
			'cb0a8d61e4e6c89dd6f0577e62acb0c886eaf0f1a13903fb846ae8e6953a6317ac3f443fae8bd43ce0f742dab51935a614f4a6ef316b47d02a1d3adadb420098'
			'10c6d3f0f5dd1e5ef50404540c9fa51f7db331421f924a53d10987e7fb943c0d8e1b1502c8cc6d82090811fe50af6282d422eb5dbd719b442502898b7fa37cbf'
			'006a4ded4d8c06449f524a14ac2a8e7bdfefc171e7e630e06c380c56898799b63bfecfbb5536118b1648f883ffa1b29d452fcef733cd9c33b40fc64eeadd7cb8'
			'bab6fac212cb334c176b5a5066e20fe42043ec0034cd73411643bcc1f2451661d35645199eba16ccd06c6a9684855f0ba20136b45adc1ec34a03a486d4b310ad'
			'2f5e542d145976d18478323ea64c4755de17271030e7674295634cef3c2a3b1c89c205530ee869875e5ce462f07c10d6976013046351e261e2d6e717cef28d67'
			'f7d386022831d80974983dd670251a42e1d649b14a0581458ae8f6c472b69c33536ffc5d09d700cfb89b24b517a8e0981d91fc356712414995240f36ca84155a'
			'6ca5485f5a6fb9bc3aa0d6fa4fb96598c6a642dd6ad3f4566d1f3183c584d3983c14d763fee6aa01429e4e204999da7cf8b684292eb7fa528374915a3117e1ab'
			'aa43fe53bff733b7acbebaea24fc74df1968c51577dbc8176b363efc5087b1a4d302e30d2b1a606a4db5863894cc73ef7293df6f1dcc61eb94ebfb67b5630a6f'
			'09b0d97269cd9d9d63408cdc34d7600a743150cafdde8ae09c0d0569988c466d6a481d4c1caf57b1e8a9034a01afc3580621ad1bdb8bb0b113c930045ed737e4'
			'62f1f7e1eb49ff8bedbd3e54c33fb3468c63de909b3d9754d1b2e46b7b14e2eaec483f03e8a45eaf3599af3b304054862735d38e22659437cbafe39d510d553d'
			'd3cec955e9a2ec8358df5110d38254fc09fd2b67c9c4363691f69c9cfd3f435d3eff861cafee1c27cfb22182f53dde22b27cb41d679292555e91ee2201b24176'
			'0e0ff5f38bf184db1a5553dc95b6455a3564d1273d21f41c672d80f3e98b3fa7477994624864d23c363ddba3a29c418a1025c32942d7d2e40ea38e930679cb09'
			'd3a059155610009ec18a92b260e616d57550557c871f0d1d1b73e00ce8cf9883bb968e957cfd40d494cd3a93c32b8bf3494c0e1b49229738d57d4674443c14fe'
			'17bd36cd016441e70601fabb3b08a7ed56d8a38f42b42bf43913b0a4913a47a4beed45ebf89e33ee17b833f13fe26b5abce2effa6343d21b3d14283c682c18c1'
			'3db56ee71963bae7eb187a1b9c7c0e6e346227601b1624e0e83308da5c3e4c4cf78ce2d7453f58c66bcb35aa0810dca9d561bf7f63ebddbc52063da0301c1839'
			'f5e2239ed4de3157647b742d518acbbb06b041e7504174b7dd730d269a69cf97a03a4d13e86afd570fffe0546fda83084c7ad8faa7d2878fc7a632cc20ba6f6e'
			'82c9eb8ab7238ca1ee8e884445aab8d6bf20e4a6fed96278874e23494b138b51c8bda65ca6b7d14f309f011d182c33ce7a10c75c931cd170e03960193e374378'
			'5a3cfe5541c72fe0c6642930ca9854ee84bea11cffe8ce84027a71ac9eabb1da11eca49bb0cfb43dd9a80923e8fce43aa96e2390a7910aaa7f56f8f9662f7094'
			'8fdca783601af8fb606513947beaa41292d2282c3273c82ca80efe8f203b37ae3213f2a44ed660fb55aaca44c9322e8c6f1c8713f8d2dbbef5859ce66daf0848'
			'f5d451b2cb865447dd4720d99c0bb84054e4043601ed43343309c7f4e3a13fd58e158549100d3ad6c9061b0cb016ee09993eaa832c527eff40d70bbb0a80c858'
			'9bc05b7abddcee927eefc7a5e03507006eba5103d370474f04a27556a2d4bd2ab9e1abdf223b274794c855d4ea15af9e7bb53dbf6ddc3500bceaa43772aa4317'
			'0e7c6eef21a78a4acf7916bde9dd4916837a7946560f0507630585144dedbb58394def311bb8541ecc2d790bd99438865ea4ea3877c0dc4c07321894c7e1c41c'
			'3bc90cefe1e373a29e26513276a3523663d4478b26c6c44db21a2d0800aff3e8604f202a1c21a3223b10c3fb819f2a5291081211a760021f74622cd3db6cdd20'
			'758be0f6cd6d1783eaeb80fe68776972915a0b86a507d060b317fe03be635e28540503f75809c25e759ec9f8ec197febbd3557b6dbf918b53f128a9b836663f6'
			'09a979c05a8203dad129456f1cb639e2aac3a1fdcdfbdd96c60821724a0989ba9f934b0c86fe0149a002cd4e40e87588741b2e742e7c2480341efeeded008359'
			'af2cbcf9bb1a73ab4548b6a769bb6d85ffa1ac76509c0d28647fe98708bec302c82aa0ca5c8c4729073ea89e8974b4f7fae90224c3dfbddca55a72d2a53f6ea9'
			'9ec71c28cdb3cd4b71582e851035657f2d69f8d7da7b8b4ecf7fe3691c7f268b363b86ba6dbb3d972de454f4134ba809afd0c9969bc9db028c0e3611be72771b'
			'99b43630f06126d7780d80876c85ce566e10e8c4b01a208fa9095de4910d012dd2d73b415f2b1d9585640f8b6ec456050d92723e03893b7ecd0e7ca723c32f2a'
			'1d68d6adac2aa3480d804e5468043ca9f225c0d3ebf8d58349072ba4636aa7663d15bb4c72834326f73e146dac9cb57074c758b2d2252e1db2c2a886f47f31bb'
			'ae2665aa94448fca188fcd02260b76f9a151935d49e60bb6618bb8104efcc7913b2c9baa563540d9ae9af48c55b7fafe8b07c59eab86f558af957527185d9214'
			'eaa428695422df02bfbfd5dcec30375dd1bbd0f38b05f08b376788d22944f02af3b1cd205e96731cb78a32b7a262286380a568ab81ab385acf358d8e3f1595d1'
			'b10268ab74c988da9ac6dfe36e639a4103e32bfd6aa317595fb08137ad34f3e200c61c00ce6f796a4dc3f6aa72032347f14cd70e01ff36638c544dd7f78cd849'
			'bd091940af14a616c2d3d159a1fd4caa7b938eb2ef4b947652eec8cdb2ccc7e81c02d0c70bfc0062c9d8e6e5e86a305e90cc9bbfe1b4ab0aa108a4037a5a1812'
			'542116ce563e2e4228d3a1dc7a8ff985e43966f668ed008249f313cb93e4f2bbb4297395337dcef660775c419db2443ada0dae9b2d73f1d2e0d5c235ad57b2ef'
			'64a45f0e0c144e80a2de9250fbed4e5e8870e6a80d29c2190c6ffdb997bcdf8ad1f06fa0c5ebb264ddf2dbe68de9a015c9606582302de102434bf1cd8a57d188'
			'bd4cb8ab81cc92b32aaa49679551b212b5965c11a6bac92cf127b481e0d0999d8023068f7c2d4fbc30ef91ff024319dc73b61c20e2cba94efcdcc83a684fc7fb'
			'ded210698a47892484e12eb016b493578f0f2932b372475fd86eea6d1ebffd411855961b04387f8e3e2a6dc40eba9aa8c7820aa0e76ee11b1436a0b9560ac959'
			'69766fc79023a261f958dca1c370e3f097cf2fdf6a8ef1ea3ca572f78170d3e71bad739d0d469122b2955992b3b7177cea34865eefd0235907e8a4cf936f119b'
			'f85708ea96b06fd2acf57a712e868228f8d80e7dd0fe72c5916cfd91f383ec091dbc7da714559c37848f4fc1d00b9c45700aa15e8ca53899c1a156bb307691a4'
			'bc312860f88f120c1ca28d9982c37131e92210f09e097cc21ad245b5168df46714886a3dc13969f619bf205413d6224ecdb4fb0c894b6b12920ef983ce24006d'
			'a591c1c937bc8d6cdb744636bd2e347cfbceba1bfd4ee23e450373fcb37c4827230814b739dcab6dd1e199520020e823db36d25f2576e6cde4d1a0bec66b878b'
			'34c2577f535b79f3ad44fd986de8ef89e66b0a43091d5e171e21ef3e3ae32883a7d8ea0de0e23c50480b814ad3bfc15be30a8cc38c26da234a8df1c1d059a9b8'
			'705d984f9bd265ed497a6e6b2a3baa0f247d5310a909ee86e60802de5d3c6df36464f5b2cc0ff8946a9e90d4ec8f98151352a79cabe487384ad00f81c89fd9d3'
			'224b87b4a5b64a490f17cb8df750d4a5a71dbf0edfcb0be69f9cf3c305c968bfabdef185dc32b0658686a8b57129abb5fac5bc48a1fc7cb0634b14b83a8ccc13'
			'477a884ea80ec894dbbb4dd69f0ae981c0b7537268938aeba6fb103ebb7fbfcb0bd3099227b81583f65417441e8218ce12d4d109af5b99c164502a67cc902144'
			'1c2e5d196076cec19a409b655fa298406230f02631bf75445eaebc2605ea0c28fb4572a436b7be82e8e7f2f606135760230518381dc5c983ed2c294e6b02aa1f'
			'36af8b7e51a1d0d9e03d64ccf49caff8d3afefac1d2fb75712f09e1544549d36cda903d9029a5552189a4474b517fe8c7d988b6047758b9ae39a9a7b1a0f3ebc'
			'63649fa9edfb4c717020f6b425800c5fa300ecceea8509706143b9fdcf3032711e6ae018e2ceeb2adf409942a992561e840eb094f09e359507910b742179291c'
			'ed181186baf02cb4f176cd5c90a83d05011a373b3cd3d977aa2e23b8177eb0712a86630ab881c609cc17d59803776c535a83c6ff8c45fb274dcfbd4eb2a6e402'
			'b4ae314acdd382e5a96839a711fd66985cceb0bd74a6b0aef159d50b86e03701029681a94811de8be36012d2fcdaadafbbf3275e89e065fd96c87f52c76e05a6'
			'9e506d09e8f1a2901f8333f60888f711d83f8f454caf0ecf842396fa7a918db68ab2908b9b396003b2d554503a956c236b979c0fb535c7eea4ec65e7ad50c717'
			'aad88f476a8e025ca021567a0bc06228c36594677f3994d61aa9fa95de77f2fcd4df2f5a47315fde8c3cd08012684f1e7ddaa29531951d831b7e98eada096d01'
			'5e740bdc4bf657319e8ef9b13aef2e3f1f2999ddd86c53d16b40b6135b9102efe0236338b3e67ceaecaa884c490e464028bead43bc0bc76a5326098853c66e0b'
			'a942ef01e9784017756ef239332ac763f74d14f546aa7706813543d76c735564b23e1b2156b50cefa78774095d04dc7a7ab201b5a635ad495d60db543225c9f9'
			'10bf51d31afb2f5780b7d97501f7931c4bd7844c852a750f95db4c0314f139d9cb703833106214d13f3301677357b5ed9b23d7d0d549a598e7af58caee72cdc1'
			'83e16a9f40d96e88cc6ca0cfecef46386a0fad42c1a283b1a391e5be50825448c0d711c36af9fdf5d9d0c17c9ea5d6618a75fa0a69bced702911c705bbe9be0a'
			'be9fab09e27c3d0e0df4686933a133897e7eef7141095e27b3c7991deac2a948859f582334523438d4a65376086b89a6a4ff34582a20b0d46fe01677610eebc4'
			'bbc2b8cd47c0dd902ddf75a64e469fb1eece28c71eaecd100e0777e288b48603a496b3608fc0f52ce78c51cf4fe7554e7bf7bcdda9b1a89fa7f5ccaec94873fa'
			'66229c6f3bf9a7f99595b7bf2e254f8ce4519c50c7dd3245b7c61c721dbd3cbcc8a3279c289f9b00f6c4f603379de91fe99425a537ff3176eadf55b9cfc8946f'
			'e50eb2ff2a54217e20bfa030784766fabfb19cdc020b817631eefdd81e6b46a31b42dae4ff828152ead8620e4af3a77a3e73e32729691ad98ad906f35ed26f15'
			'8b5385f434300eda9dead082bf15fbff59f985b1b43ad2c2a14a4d292f2767a7a5e0a17a474e6f5c3bf8d7afe4d0fd7ccfbc6e86fc325f231747d441eb726e02'
			'4c2d8ed24f0a60f63f6b2d6de06c00f6ff6341f0eeafdbadbff6420d155004d9056cc1ed85bd56bd53c41b3cfea54c9dd798307b6cd32d492f7d5abc911b255a'
			'e6e439a611cdb5389a255503a6f54cdc9d67fe0ecd410f2a009e16386abdcceb04e8b260b131a094de82ae1dbfc222a0a215570d9bb50156a6ae2f7840d39cab'
			'3d601e605747a8c8f4be163f5c74db1800b0247eacc1794dc1241c70feb309dc5a35c30408f508a8c3200ff5f0ad7781564876063c09d16d3d50c8992a1bf957'
			'cdc167038762a7d12dbb42912eb8def746ac682881af60b43f4ded9fc4ce1aff0c06a761a1ffe6994029dbde6689b999f8809c0396b40b64d8505ce4ed9ef032'
			'c053dbfa6bd50a7b734e9d4365273a10986b655508c8c01f00c513e20c1a2b859b8d0a05c56d64000eb44470058db1243ca66f09064524e6a4d4f57b64580762'
			'cd6df02ddf052ae0f4ee22fc2343311b90f1af49ef92eed9cc7e0d251d310fc64c6e78cc552840c6e99aa86b5cb9bda92b038235ced3203f6752507bf818ff38'
			'e9bce0c1f3b9c65ef486dd084b380a260b3b004a8f9f9b861147c9da7be822c78083bf89790bc39f791be67e6d23a32775e061c0a4c531ae010bece1888b0f47'
			'54903be20d3ee706bea2ea814ea9dab8026f5f81367ce3bb04bbf04e60bb83abac70a0b31d99c36c05709acce94ef8f08da402027374b0b648fe474cd94e8048'
			'6cba19596a67d77cd3cbd2374bca4cace0ad3062289832c62fddf37366c2f32d67b13ccb1f49efb2e24749effcea4ad446d46dad2a7279196a3692538367ab24'
			'926431b225a737763761558bdc0e20c59085ac3d7a719ace7ac24c5cd20700fbfa2b57a1291879c6087ee5956409adbe61ea477a0aa7ac6d5bef57aaf5d139a3'
			'64fb10774ff20a0bb064f6d2a2f4beb8ec83e78cd184661c154778c9ce0d701fd83596ad94cafa82c3c9d7799b3c8756418951206a9d3a010738be96fa655023'
			'e93285bad68022a6aa74d3b42550b7799b9b5b65a0a40bc001c14bd88f471ca2d78a39d852c2331cffe0d05d5d8bc18e1d1779f29052001389b88cadd76de031'
			'29b16193f9e01e2b7e5cbfa8894d7b44cea6dbdcce11b0be764aeefd83d0a66a20a5ec7f7e7368351b4c9ea8c759a504c392df98e3771f8dbe719797b406cd25'
			'a8802bfc661db74da05d996d1967328e10d4cd787aa576451a2a7f6c5b2a2edc72aeb3ed986ae0364056aa1f11670a48abe0ceae7bb073fe39d0ee4704540ef5'
			'1b444ffe1ccb79e7b794032367ceb998f31cf7c3d302636b774681147a0db8b8d53ca5755094177e08f4886a5436e753ab3a632e3bbf97d780e05f19d017767a'
			'0953789fba110e76b09c1a40b05e22ddf1c723379bd7d93979180c0f83e9b6553a3a3d87a1a6a5834d46f33c93b408271cf5bbf47c6e6e28cc29a35c6b03479a'
			'b6ca7628cc26c8115462accdac8c033ff9eaf4188e9350b18de21c126c9774ad41adfd4fd0660c0f89b0bb160481174b22274a87c48fb98156081cca76c30ca8'
			'784fc12065cd2eec1f5990bcbe90ead94cb7d51a15c32cfa7e16e9e18751ab67d026fa56414be8f992a00e80b333e28d77108e7c563ebd657ddbc54e1d47654f'
			'712ba4c9690535e0b3c93c9fa12689d84dc5b508074fc5aeb074072a96514826b41e8d269d5d38e5f2c25e10000b072fe2e9f675d899d63f5131f2e13684d7c9'
			'35f7f7b697156fd18e0ab80c9e8b1f23763732f14b278f7395377add69646a1a7abe2ab760684dd3d8ef5dd37fa0f3c78b19f7d3fe5c7be120c3406b7382f70b'
			'cc578d556bc82247d28742eb2b8d8ddafac3e02af7a4effcd65528fd63b512cede85972102aef21b323095687c59da70904c5946922d3b6012ce9b9ce3c4e54c'
			'26c8ec091b32da935f1f8e56ccb33081beb7e30f27963107388c8490dfd321516908fe1f4d43b216591276cf484797d16ac15d16599e04e05e5545e4fd1979c0'
			'41b92e526c4aa9c90b3a9129133f6f5c264ec41806178d35e864a2c93c0c5d7200a2443c82ef0c02af453074f86463589eaa809b695996eb14b4b99aaf18f64f'
			'233f271511cc1475fa019b0cc0ebbf8a40209a65be9bb1b1245aaf237a5e44f9acb073b066d4bf35f25655db7a73fd21f7d08cd1e6219d2931053f770e64ae4c'
			'5f1d743bb9aab98eea8ced0e1c179ca18046a99394da34b7529b5ba41b197b657d71aa7993a8bda8604c1b6ae20c4e95881307dce9a9805ca78ffbf537c6131a'
			'305a8cbf21b63d230ab7e7bad5c796192f9056477ecd944e9f529afcc13d4cdf5f36285f819220e880633d759ee3399bcc48fc08fe5ad31de538c1f991c64c04'
			'942d6d7bbab6684d60c63ec77bfc380da8c0cd9f7be8ddba176b5285af770a518be073abcde92e0bb12ace96082643010c45c213b1dd2e8033a73aa2bc886ad1'
			'8799bb502dd2eda984b71ca3b8b873528863b698c615c217adf5ca5491b2223775721aa292d4d6e1b22b30a44554972bbd062df9f07f879d041dff9020dc9166'
			'df578a48589968bf5c8e1afa3b4d9fca3674ea19d9cd2b4b42ab745cffe0dde611ecdd2517a85a2ee26cfb5639423a1efa4b57746688952f48014af02c5d3d49'
			'c986f5ccbf19a26758f49c87e11ba45c803d7b01b54927e9b0c18a16bcad0c2886d910480577cd5470e5e7a63f232300658ae2826b07e9bc38988c63d4e7bd5a'
			'4e9e9e2a4d08accd6641b6266caa47f12bd657bb1a7291a20b360c1b9d6c83d320be3fe475bb6b62bc172a14fe684b3ecb6ad7a8dbb0b391660bc3c30bd66347'
			'552d1bde7a7e93b8ee35218d51bcd30d8e8e3e23287d02b157b17a7f4f5b6eeabcdefd412f08f25e8028dc7c0f66a938ae6a855675277e787aa1f3a35abf4e58'
			'c0b00680c41b4f9cd9e5fac6b33eada3565c4ed45caf16a2d0abd7b02ddf70b30c0b425919abf2eb6fa22a46416b69073ad71c6368fb699228f4a3f21f2c36f6'
			'6f689a54ac0dfc09dbaba5693d484d265dae7ef92887ec5330bd3fdca90c2af4b42a6d2c79074f09510bc643dd22048400b5f65918b4ce880fe01da36f5ecc9e'
			'e48cd4f4de571784ad172f592c710ef1fdc5f72c426951252f32b4c7fd33c7dffcca0208a188903e48c0fae568d5c4d1de47d32492aa7511261e20f1e4d8558c'
            'd0fb7f0e1a3d98a170ebea301226ad8caa7ffab9fc0bee224abc31c22875c892b43d3468dffbdd15eb71ca1b5260e039d0fceb21ecc92341b9bb6949d7e9be6a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# Helper macros to help make tasks easier #
apply_patch_with_msg() {
  for _patch in "$@"
  do
    msg2 "Applying ${_patch}"
    patch -Nbp1 -i "${srcdir}/${_patch}"
  done
}

del_file_exists() {
  for _fname in "$@"
  do
    if [ -f ${_fname} ]; then
      rm -rf ${_fname}
    fi
  done
}
# =========================================== #

prepare() {
  cd "${srcdir}/Python-${pkgver}"

 apply_patch_with_msg 0001-sysconfig-make-_sysconfigdata.py-relocatable.patch \
  0002-restore-setup-config.patch \
  0003-build-add-with-nt-threads-and-make-it-default-on-min.patch \
  0004-MINGW-translate-gcc-internal-defines-to-python-platf.patch \
  0005-MINGW-configure-MACHDEP-and-platform-for-build.patch \
  0006-MINGW-preset-configure-defaults.patch \
  0007-MINGW-configure-largefile-support-for-windows-builds.patch \
  0008-MINGW-add-srcdir-PC-to-CPPFLAGS.patch \
  0009-MINGW-init-system-calls.patch \
  0010-MINGW-build-in-windows-modules-winreg.patch \
  0011-MINGW-determine-if-pwdmodule-should-be-used.patch \
  0012-issue6672-v2-Add-Mingw-recognition-to-pyport.h-to-al.patch \
  0013-MINGW-configure-for-shared-build.patch \
  0014-MINGW-dynamic-loading-support.patch \
  0015-MINGW-ignore-main-program-for-frozen-scripts.patch \
  0016-MINGW-setup-_multiprocessing-module.patch \
  0017-MINGW-setup-select-module.patch \
  0018-MINGW-setup-_ctypes-module-with-system-libffi.patch \
  0019-MINGW-defect-winsock2-and-setup-_socket-module.patch \
  0020-MINGW-exclude-unix-only-modules.patch \
  0021-MINGW-setup-msvcrt-and-_winapi-modules.patch \
  0022-sysconfig-MINGW-build-extensions-with-GCC.patch \
  0023-MINGW-setup-_ssl-module.patch \
  0024-MINGW-generalization-of-posix-build-in-sysconfig.py.patch \
  0025-MINGW-support-stdcall-without-underscore.patch \
  0026-use-replace-instead-rename-to-avoid-failure-on-windo.patch \
  0027-MINGW-customize-site.patch \
  0028-add-python-config-sh.patch \
  0029-cross-darwin-feature.patch \
  0030-mingw-system-libffi.patch \
  0031-msys-mingw-prefer-unix-sep-if-MSYSTEM.patch \
  0032-mingw-use-posix-getpath.patch \
  0033-mingw-add-ModuleFileName-dir-to-PATH.patch \
  0034-mingw-add-BUILDIN_WIN32_MODULEs-time-msvcrt.patch \
  0035-msys-cygwin-semi-native-build-sysconfig.patch \
  0036-sysconfig-mingw-sysconfig-like-posix.patch \
  0037-build-_winapi-earlier-so-we-can-use-it-in-distutils-.patch \
  0038-cross-dont-add-multiarch-paths-if-cross-compiling.patch \
  0039-mingw-use-backslashes-in-compileall-py.patch \
  0040-msys-convert_path-fix-and-root-hack.patch \
  0041-allow-static-tcltk.patch \
  0042-mingw-pdcurses_ISPAD.patch \
  0043-grammar-fixes.patch \
  0044-builddir-fixes.patch \
  0045-msys-monkeypatch-os-system-via-sh-exe.patch \
  0046-msys-replace-slashes-used-in-io-redirection.patch \
  0047-remove_path_max.default.patch \
  0048-dont-link-with-gettext.patch \
  0049-ctypes-python-dll.patch \
  0050-gdbm-module-includes.patch \
  0051-use-gnu_printf-in-format.patch \
  0052-mingw-fix-ssl-dont-use-enum_certificates.patch \
  0053-fix-using-dllhandle-and-winver-mingw.patch \
  0054-Add-AMD64-to-sys-config-so-msvccompiler-get_build_ve.patch \
  0055-MINGW-link-with-additional-library.patch \
  0056-install-msilib.patch \
  0057-fix-signal-module-build.patch \
  0058-build-build-winconsoleio-and-_testconsole.patch \
  0059-expose-sem_unlink.patch \
  0060-cygpty-isatty.patch \
  0061-disable-broken-gdbm-module.patch \
  0062-build-link-win-resource-files-and-build-pythonw.patch \
  0063-3.7-mpdec-mingw.patch \
  0064-disable-readline.patch \
  0065-fix-isselectable.patch \
  0066-use-_wcsnicmp-instead-wcsncasecmp.patch \
  0067-_xxsubinterpretersmodule.patch \
  0068-sqlite3-module-defines.patch \
  0069-configure.ac-fix-inet_pton-check.patch \
  0070-set-venv-activate-path-unix.patch \
  0071-venv-creation-fixes.patch \
  0072-pass-gen-profile-ldflags.patch \
  0073-pkg-config-windows-must-link-ext-with-python-lib.patch \
  0074-importlib-bootstrap-path-sep.patch \
  0075-pathlib-path-sep.patch \
  0076-warnings-fixes.patch \
  0077-fix-build-testinternalcapi.patch \
  0078-extend-MS_WINDOWS-flag.patch \
  0079-clang-arm64.patch \
  0080-configure.ac-set-MINGW-stack-reserve.patch \
  0081-Don-t-use-os.pathsep-to-find-EOF.patch \
  0082-Fix-extension-suffix-for-c-extensions-on-mingw.patch \
  0083-Change-the-get_platform-method-in-sysconfig.patch \
  0084-distutils-compiler-customize-mingw-cygwin-compilers.patch \
  0085-distutils-compiler-enable-new-dtags.patch \
  0086-distutils-MINGW-build-extensions-with-GCC.patch \
  0087-distutils-use-Mingw32CCompiler-as-default-compiler-f.patch \
  0088-distutils-find-import-library.patch \
  0089-distutils-avoid-circular-dependency-from-time-module.patch \
  0090-distutils-generalization-of-posix-build-in-distutils.patch \
  0091-distutils-mingw-sysconfig-like-posix.patch \
  0092-distutils-get_versions-fixes.patch \
  0093-distutils-install-layout-as-posix.patch \
  0094-distutils-msys-convert_path-fix-and-root-hack.patch \
  0095-distutils-mingw-build-optimized-ext.patch \
  0096-distutils-cygwinccompiler-dont-strip-modules-if-pyde.patch \
  0097-distutils-get-compilers-from-env-vars.patch \
  0098-distutils-add-windmc-to-cygwinccompiler.patch \
  0099-distutils-fix-msvc9-import.patch \
  0100-distutils-mingw-add-LIBPL-to-library-dirs.patch \
  0101-distutils-Change-the-get_platform-method-in-distutil.patch \
  0102-build-Fix-ncursesw-include-lookup.patch \
  0103-tests-fix-test_bytes.patch \
  0104-time-fix-strftime-not-raising-for-invalid-year-value.patch \
  0105-ctypes-find_library-c-should-return-None-with-ucrt.patch \
  0106-build-Disable-checks-for-dlopen-dlfcn.patch \
  0107-Fix-install-location-of-the-import-library.patch \
  0108-Set-MSYS2_ARG_CONV_EXCL-for-the-shared-Python-module.patch \
  0109-build-Integrate-venvlauncher-build-installation-into.patch \
  0110-configure.ac-set-_WIN32_WINNT-version.patch \
  0111-configure.ac-don-t-check-for-clock_-functions.patch \
  0112-expanduser-normpath-paths-coming-from-env-vars.patch \
  0113-Add-support-for-Windows-7-Python-3.9.patch \
  0114-Commit-regenerated-importlib.patch \
  0115-CI-test-the-build-and-add-some-mingw-specific-tests.patch \
  0116-decimal-backport-build-fixes.patch \
  0117-smoketests-test-that-_decimal-exists.patch

  autoreconf -vfi
}

build() {
  cd "${srcdir}/Python-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    CFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1 -D_WIN32_WINNT=0x0601"
    CXXFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1 -D_WIN32_WINNT=0x0601"
    CPPFLAGS+=" -I/usr/${_arch}/include/ncursesw "

    declare -a _extra_config
    if check_option "strip" "y"; then
      LDFLAGS+=" -s "
    fi
    if check_option "debug" "n"; then
      CFLAGS+=" -DNDEBUG "
      CXXFLAGS+=" -DNDEBUG "
    else
      CFLAGS+=" -O0 -ggdb"
      CXXFLAGS+=" -O0 -ggdb"
      _extra_config+=("--with-pydebug")
    fi

    # Workaround for conftest error on 64-bit builds
    export ac_cv_working_tzset=no

    # export LIBFFI_INCLUDEDIR=`${_arch}-pkg-config libffi --cflags-only-I | sed "s|\-I||g"`
    CFLAGS+="-I/usr/${_arch}/include" \
    CXXFLAGS+="-I/usr/${_arch}/include" \
    CPPFLAGS+="-I/usr/${_arch}/include" \
    LDFLAGS+="-L/usr/${_arch}/lib" \
    ${_arch}-configure \
      --with-nt-threads \
      --with-computed-gotos \
      --with-system-expat \
      --with-system-ffi \
      --with-system-libmpdec \
      --without-ensurepip \
      --without-c-locale-coercion \
      --enable-loadable-sqlite-extensions \
	  --with-tzpath=/usr/${_arch}/share/zoneinfo \
      "${_extra_config[@]}" \
      OPT=""
    
    make

    # wrappers
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python${_pybasever}
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python3
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/Python-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    if check_option "debug" "n"; then
      VERABI=${_pybasever}
    else
      VERABI=${_pybasever}d
    fi
    
    [[ -d "${pkgdir}/usr/${_arch}"/share/gdb/python3/ ]] || mkdir -p "${pkgdir}/usr/${_arch}"/share/gdb/python3/
    install -D -m644 python.exe-gdb.py "${pkgdir}/usr/${_arch}/share/gdb/python3/python_gdb.py"
    
    chmod 755 "$pkgdir"/usr/${_arch}/bin/*.dll
    install -m 644 libpython${_pybasever}.a "$pkgdir"/usr/${_arch}/lib
    install -m 644 libpython${_pybasever}.dll.a "$pkgdir"/usr/${_arch}/lib
    
    # some useful "stuff"
    install -dm755 "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/{i18n,scripts}
    install -m755 "${srcdir}/Python-${pkgver}"/Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/i18n/
    install -m755 "${srcdir}/Python-${pkgver}"/Tools/scripts/{README,*py} "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/scripts/
    
    # clean up #!s
    find "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/ -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python3|"
    
    # clean-up reference to build directory
    sed -i "s#${srcdir}/Python-${pkgver}:##" "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/Makefile

    for fscripts in 2to3-${_pybasever} idle3 idle${_pybasever} pydoc3 pydoc${_pybasever}; do
      sed -e "s|/usr/bin/python${_pybasever}.exe|/usr/bin/env python${_pybasever}.exe|g" -i "${pkgdir}/usr/${_arch}"/bin/$fscripts
    done

    sed -i "s|#!${pkgdir}/usr/${_arch}/bin/python${VERABI}.exe|#!/usr/bin/env python${_pybasever}.exe|" "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/python-config.py

    # fix permissions
    find ${pkgdir}/usr/${_arch} -type f \( -name "*.dll" -o -name "*.exe" \) | xargs chmod 0755
    
    # replace paths in sysconfig
    sed -i "s|${pkgdir}/usr/${_arch}|/usr/${_arch}|g" \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata*.py \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/smtpd.py
    
    # Doing sysconfig relocatable as patch 0000 do it only partially
    sed -e "s/sys.prefix + //g" \
      -e "s/'\/bin'/sys.prefix + '\/bin'/g" \
      -e "s/'\/include\//sys.prefix + '\/include\//g" \
      -e "s/'\/include /sys.prefix + '\/include /g" \
      -e "s/'\/include'/sys.prefix + '\/include'/g" \
      -e "s/ \/include\// ' + sys.prefix + '\/include\//g" \
      -e "s/ \/include / ' + sys.prefix + '\/include /g" \
      -e "s/'\/lib\//sys.prefix + '\/lib\//g" \
      -e "s/'\/lib /sys.prefix + '\/lib /g" \
      -e "s/'\/lib'/sys.prefix + '\/lib'/g" \
      -e "s/ \/lib\// ' + sys.prefix + '\/lib\//g" \
      -e "s/ \/lib / ' + sys.prefix + '\/lib /g" \
      -e "s/'\/share\//sys.prefix + '\/share\//g" \
      -e "s/'\/share'/sys.prefix + '\/share'/g" \
      -i "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata*.py
    
    # strip executables and libraries
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    
    # install wrappers
    mkdir -p ${pkgdir}/usr/bin
    install -m755 ${_arch}-python${_pybasever} "${pkgdir}"/usr/bin/${_arch}-python${_pybasever}
    install -m755 ${_arch}-python3 "${pkgdir}"/usr/bin/${_arch}-python3
    install -m755 ${_arch}-python "${pkgdir}"/usr/bin/${_arch}-python
    
    # create relative symlinks
    ln -s "python3.exe" "${pkgdir}/usr/${_arch}/bin/python.exe"
    ln -s "python3w.exe" "${pkgdir}/usr/${_arch}/bin/pythonw.exe"
    ln -s "python3-config" "${pkgdir}/usr/${_arch}/bin/python-config"
    ln -s "idle3" "${pkgdir}/usr/${_arch}/bin/idle"
    ln -s "pydoc3" "${pkgdir}/usr/${_arch}/bin/pydoc"
  done
}
