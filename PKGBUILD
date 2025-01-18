# Use environment variable MAKEPKG_AYUGRAM_API_ID and MAKEPKG_AYUGRAM_API_HASH to override default values

pkgname=ayugram-desktop
pkgver=5.10.3
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode."
arch=("x86_64")
url="https://github.com/AyuGram/AyuGramDesktop"
license=("GPL-3.0-only")
depends=(
    "hunspell" "ffmpeg" "hicolor-icon-theme" "lz4" "minizip" "openal"
    "qt6-imageformats" "qt6-svg" "qt6-wayland" "xxhash" "ada"
    "rnnoise" "pipewire" "libxtst" "libxrandr" "libxcomposite" "libxdamage" "abseil-cpp" "libdispatch"
    "openssl" "protobuf" "glib2" "libsigc++-3.0" "kcoreaddons" "openh264"
    # libtgvoip nimf rlottie in aur
    # Ayugram reverted that change https://github.com/telegramdesktop/tdesktop/commit/960761ef37fb7db57c40df6211164ae002f1063a
    "jemalloc"
)
makedepends=(
    "cmake" "python" "range-v3" "tl-expected" "microsoft-gsl" "meson"
    "extra-cmake-modules" "wayland-protocols" "plasma-wayland-protocols" "libtg_owt"
    "gobject-introspection" "boost" "fmt" "mm-common" "perl-xml-parser" "python-packaging"
    "glib2-devel"
)
optdepends=(
    "webkit2gtk: embedded browser features"
    "xdg-desktop-portal: desktop integration"
)
source=(
    "AyuGram-v$pkgver.tar.gz::https://github.com/AyuGram/AyuGramDesktop/archive/refs/tags/v$pkgver.tar.gz"
)
declare -Ag _modules_name_map=(
    [cmake]=https://github.com/desktop-app/cmake_helpers/archive/8c146a3ec6f4475e5083eee84d126960495a7e1d.tar.gz
    [cmake/external/Implib.so]=https://github.com/yugr/Implib.so/archive/0ddaa715d2572b100f8248c0fa4450fbf895be14.tar.gz
    [cmake/external/glib/cppgir]=https://gitlab.com/mnauw/cppgir/-/archive/c8bb1c6017a6f7f2e47bd10543aea6b3ec69a966/cppgir-c8bb1c6017a6f7f2e47bd10543aea6b3ec69a966.tar.gz
    [cmake/external/glib/cppgir/expected-lite]=https://github.com/martinmoene/expected-lite/archive/95b9cb015fa17baa749c2b396b335906e1596a9e.tar.gz
    [Telegram/codegen]=https://github.com/desktop-app/codegen/archive/46545f547e75afa8500fc21b6e18d60ba3405cfa.tar.gz
    [Telegram/lib_base]=https://github.com/desktop-app/lib_base/archive/70918d74b40d0ea82c194ca16583cfacc648076b.tar.gz
    [Telegram/lib_crl]=https://github.com/desktop-app/lib_crl/archive/c1d6b0273653095b10b4d0f4f7c30b614b690fd5.tar.gz
    [Telegram/lib_lottie]=https://github.com/desktop-app/lib_lottie/archive/1a700e5a0d7c3e2f617530354ff2a47c5c72bb4a.tar.gz
    [Telegram/lib_qr]=https://github.com/desktop-app/lib_qr/archive/6fdf60461444ba150e13ac36009c0ffce72c4c83.tar.gz
    [Telegram/lib_rpl]=https://github.com/desktop-app/lib_rpl/archive/9a3ce435f4054e6cbd45e1c6e3e27cfff515c829.tar.gz
    [Telegram/lib_spellcheck]=https://github.com/desktop-app/lib_spellcheck/archive/f6594068d4282aa84c51c7242d40213f3e0bf6f6.tar.gz
    [Telegram/lib_storage]=https://github.com/desktop-app/lib_storage/archive/ccdc72548a5065b5991b4e06e610d76bc4f6023e.tar.gz
    [Telegram/lib_tl]=https://github.com/AyuGram/lib_tl/archive/79243fd193159382c204dde76d87584ed83ad06b.tar.gz
    [Telegram/lib_ui]=https://github.com/AyuGram/lib_ui/archive/392679df43cec3a66c6bd3e1187d4238c60467cf.tar.gz
    [Telegram/lib_webrtc]=https://github.com/desktop-app/lib_webrtc/archive/169ba6b1d5e58e9d1cfa7b7d5c85c119e6c6e2db.tar.gz
    [Telegram/lib_webview]=https://github.com/desktop-app/lib_webview/archive/46c8bd206efb11ccc28e2edaaffff360cec74ff0.tar.gz
    [Telegram/ThirdParty/GSL]=https://github.com/desktop-app/GSL/archive/87f9d768866548b5b86e72be66c60c5abd4d9b37.tar.gz
    [Telegram/ThirdParty/QR]=https://github.com/nayuki/QR-Code-generator/archive/720f62bddb7226106071d4728c292cb1df519ceb.tar.gz
    [Telegram/ThirdParty/cld3]=https://github.com/google/cld3/archive/b48dc46512566f5a2d41118c8c1116c4f96dc661.tar.gz
    [Telegram/ThirdParty/dispatch]=https://github.com/apple/swift-corelibs-libdispatch/archive/542b7f32311680b11b6fc8fcb2576955460ba7da.tar.gz
    [Telegram/ThirdParty/expected]=https://github.com/TartanLlama/expected/archive/292eff8bd8ee230a7df1d6a1c00c4ea0eb2f0362.tar.gz
    [Telegram/ThirdParty/fcitx5-qt]=https://github.com/fcitx/fcitx5-qt/archive/c743b12e6780edf1dcfe9071531c80f050cacb95.tar.gz
    [Telegram/ThirdParty/hime]=https://github.com/hime-ime/hime/archive/9b3e6f9ab59d1fe4d9de73d3bf0fed7789f921c5.tar.gz
    [Telegram/ThirdParty/hunspell]=https://github.com/hunspell/hunspell/archive/22c3381e2066bed616250d373fc5c935598b564a.tar.gz
    [Telegram/ThirdParty/jemalloc]=https://github.com/jemalloc/jemalloc/archive/54eaed1d8b56b1aa528be3bdd1877e59c56fa90c.tar.gz
    [Telegram/ThirdParty/kcoreaddons]=https://github.com/KDE/kcoreaddons/archive/fd84da51b554eac25e35b1e3f373edaab3029b15.tar.gz
    [Telegram/ThirdParty/kimageformats]=https://github.com/KDE/kimageformats/archive/df82311a1081e576c4ac020204578bb8a81b21ec.tar.gz
    [Telegram/ThirdParty/libprisma]=https://github.com/desktop-app/libprisma/archive/23b0d70f9709da9b38561d5706891a134d18df76.tar.gz
    [Telegram/ThirdParty/libtgvoip]=https://github.com/telegramdesktop/libtgvoip/archive/2d2592860478e60d972b96e67ee034b8a71bb57a.tar.gz
    [Telegram/ThirdParty/libtgvoip/cmake]=https://github.com/desktop-app/cmake_helpers/archive/39aa77999e4b3cdec080f8e7eec9a4a45ccf6fc3.tar.gz
    [Telegram/ThirdParty/lz4]=https://github.com/lz4/lz4/archive/5ff839680134437dbf4678f3d0c7b371d84f4964.tar.gz
    [Telegram/ThirdParty/nimf]=https://github.com/hamonikr/nimf/archive/498ec7ffab3ac140c2469638a14451788f03e798.tar.gz
    [Telegram/ThirdParty/range-v3]=https://github.com/ericniebler/range-v3/archive/a81477931a8aa2ad025c6bda0609f38e09e4d7ec.tar.gz
    [Telegram/ThirdParty/range-v3/doc/gh-pages]=https://github.com/ericniebler/range-v3/archive/2dae74bb693e42d850fb0adcc9045c5b71fbdeae.tar.gz
    [Telegram/ThirdParty/rlottie]=https://github.com/desktop-app/rlottie/archive/8c69fc20cf2e150db304311f1233a4b55a8892d7.tar.gz
    [Telegram/ThirdParty/tgcalls]=https://github.com/TelegramMessenger/tgcalls/archive/9bf4065ea00cbed5e63cec348457ed13143459d0.tar.gz
    [Telegram/ThirdParty/xdg-desktop-portal]=https://github.com/flatpak/xdg-desktop-portal/archive/11c8a96b147aeae70e3f770313f93b367d53fedd.tar.gz
    [Telegram/ThirdParty/xxHash]=https://github.com/Cyan4973/xxHash/archive/bbb27a5efb85b92a0486cf361a8635715a53f6ba.tar.gz
)

_get_source_name_string() {
    local host filename name commit
    host=$(echo "$1" | cut -d / -f 3)
    name=$(echo "$1" | cut -d / -f 5)
    filename=${1##*/}
    commit=${filename%%.*}
    case "$host" in
        gitlab.com)
            # It contains $name in $commit
            echo "$commit"
            ;;
        *)
            echo "$name-$commit"
            ;;
    esac
}

_fill_gitmodules_recursively() {
    local gitmodule
    find "${1:-.}" -type f -name .gitmodules | while read -r gitmodule
    do
        if [[ "$gitmodule" =~ ^\.\/ ]]
        then
            gitmodule=${gitmodule#*\.\/}
        fi
        local prefix
        prefix=$(dirname "$gitmodule")"/"
        if [[ "$prefix" =~ ^\.\/ ]]
        then
            prefix=${prefix#*\.\/}
        fi
        echo "Parsing $gitmodule to fill submodules..."
        local p
        grep path "$gitmodule" | awk '{print $3}' | while read -r p
        do
            p=${p%$'\r'} # Remove control characters
            if [[ -n "$p" ]]
            then
                local target url name commit fname
                target="$prefix$p"
                url="${_modules_name_map[$target]}"
                fname=$(_get_source_name_string "$url")
                echo "Filling $target with $srcdir/$fname..."
                cp -r "$srcdir/$fname/." "$target"
                _fill_gitmodules_recursively "$target"
            fi
        done
    done
}
declare _source_str _uri
for _uri in "${_modules_name_map[@]}"
do
    _source_str="$(_get_source_name_string "$_uri").tar.gz::$_uri"
    if [[ "${source[*]/$_source_str/}" == "${source[*]}" ]]
    then
        source+=("$_source_str")
    fi
done
unset _source_str _uri

sha256sums=('c3e3979df9fabe9071701af77d1db7e8f9ced6c8a93b02b5792e3f2c6f6ceb82'
            'd0d4ea2fddcbc7d10ace2c37309feb09da87e8ce7ced6ce73592da1359f4765f'
            'd4479a45f0ab9fd1822fad79d7f541caf96ba71986133f63ec56dd233bd7e793'
            '6c16c9cc1dea66bdd9340735e447906e191caf87133a10ead077fbf1bd3b0121'
            'cbc1f4bf8c28ffeb89852eda7056ff6aa80d49cb45736a583c931d5ceeccdcdd'
            '3e7253b2cc31bdf68fa50d105715158e649812e5ad6b4f1f6e5fd1e89b3ffdfd'
            'c9aa4e32eb5e475d0826154055ff4749c07bb46d83b12f1641d31557e944a16f'
            '0559a87b0726f13a51f5e7316d148a55282aaaa6fc0d61f031002fa46c9d4983'
            'e9b050279a52e48f1fed56e76ed3995329b2f99518b6afba4f97ecb13088f935'
            'a8f7dd8d210da8b9e4214ff528bbaf04f148a8552a5961e410efde8e88f44c8c'
            '8569c9bf5495b19b76ce6e2e53f40604c8618429ce728bf73b2406d1382fdc94'
            '9b1afca339bd4e0579e73e92478ea26bb0c845dca7231de031e66c2f1a4ea5d9'
            '716fbe4fc85ecd36488afbbc635b59b5ab6aba5ed3b69d4a32a46eae5a453d38'
            '11b926f9605b258c35bd9ed806a10cab7ef5edd673ad53a014427b1c71d24a9e'
            'b838912f5fdc830eaab68d5def68734ede1f6025f2c5791184773db1a4333129'
            'fe3b18aecb849029b6af94922be0c25eee1b7b86565b1c8350692ed776cf42fb'
            'eda5df4249051db521c32fb54a8e1864c4f1e50222e431028ba0cad169621ea9'
            '66dc8c843d99fb636b7bfe196f3038c7567c7395a698c820ca8c0d18a03ad497'
            '15a9981ab5e6a01f301609017aee11e000c22880d38b3be4e3da58c338f9b2fc'
            'dd9b92f8bb26cf5eb543d4e9c5c1c62e17449588caa9eaf2500db09b5f3aed25'
            'ae53e57d6674cf8776708d724f63d2f6646c6deeafd923b8e13e5bd6c6766fc5'
            '612b5d89f58a578240b28a1304ffb0d085686ebe0137adf175ed0e3382b7ed58'
            '68648a80738681b58ab9c58340f37355c73bd3be96fcc1533660eb90f57c65cd'
            'e8afd5f8db9a9793f0f2e02cada8a4578fb90c6695e7047443ef4e2548ea1bc5'
            '976909135282818237954bce77b5b21f6c88f1bf34f749ef0be6ea2058ded207'
            'd80795686f3e58448c7b76830bb5c40847b7eaae1996c28f0422a029b66c2bb0'
            'aba69c97d466e82a13ae6c1d52628c7f7ec8f85c5224f8634fa26a313ebcc95f'
            'd0752fbb2ef6dc9dd1484252fe1027282019c74168da9ed7852abdf94fc5d73e'
            '2eaf5f6976f4c990ea2c2f8f8cd0f4ec22a935f799d6f901f10088845707a946'
            '52a2e052beb67492225a38213108f1d7edd1940fd025cad3a4ae28c57d428419'
            '41641c1a7e927662a6722a1d7df4c5f60d67fed9cc1f555b6be7d13d14542a68'
            '3d2eef00fd1739a652ef22f2d081497bc9ae71008ff6736945f2d2676cc6bba9'
            '73e639df3c73136eeb1890fc54acd603849fba01443005fd3c1a288539885792'
            '7ca82e11d2322a4cc8f5ff7b33963a1420d21abb70e779023ea87126de29d747'
            '2736d6f36f9f90323f2a0ed6fa59f52b8be71f50939708dffb0eb9f8155bbde1'
            '67aeaf1aac7bc6c42c2cb187befca926423e9f8e630717e3ee4be14809dad597'
            '2438ba4fcc2398acb1f3d4ff9a42c6980d10a4b3a255cfb20ae9d4d955a68e27'
            '7238a966ee6b93fdbf2669736ddd35a6103967eb9d5369af8b740bff2401615c'
            '0bb1ac2b495bf7056a57a1b9bd6020007041eb7b6cc85467ae55d0eb5c8254e8')

prepare() {
    cd "$srcdir/AyuGramDesktop-$pkgver"
    _fill_gitmodules_recursively
    #/usr/bin/ld: /usr/lib/libprotobuf-lite.so: undefined reference to symbol '_ZN4absl12lts_2023080212log_internal17MakeCheckOpStringIllEEPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEET_T0_PKc'
    #/usr/bin/ld: /usr/lib/libabsl_log_internal_check_op.so.2308.0.0: error adding symbols: DSO missing from command line
    #collect2: error: ld returned 1 exit status
    #
    #https://github.com/telegramdesktop/tdesktop/issues/26489#issuecomment-1627535022
    sed -i 's/find_package(protobuf REQUIRED)/find_package(protobuf REQUIRED CONFIG)/' \
        Telegram/ThirdParty/cld3/CMakeLists.txt
    #https://github.com/telegramdesktop/tdesktop/issues/26489#issuecomment-1627555107
    #CMAKE_BUILD_TYPE must match libtg_owt's
}
build() {
    CXXFLAGS+=' -ffat-lto-objects'
    # https://github.com/AyuGram/AyuGramDesktop/blob/dev/docs/building-linux.md#building-the-project
    # for API_ID and API_HASH
    cmake -B build -S AyuGramDesktop-$pkgver \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID="${MAKEPKG_AYUGRAM_API_ID:-2040}" \
        -DTDESKTOP_API_HASH="${MAKEPKG_AYUGRAM_API_HASH:-b18441a1ff607e10a989891a5462e627}" \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=True
    cmake --build build
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}
