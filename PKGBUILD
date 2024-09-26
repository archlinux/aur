# Use environment variable MAKEPKG_AYUGRAM_API_ID and MAKEPKG_AYUGRAM_API_HASH to override default values

pkgname=ayugram-desktop
pkgver=5.4.1
pkgrel=3
pkgdesc="Desktop Telegram client with good customization and Ghost mode."
arch=("x86_64")
url="https://github.com/AyuGram/AyuGramDesktop"
license=("GPL-3.0-only")
depends=(
    "hunspell" "ffmpeg" "hicolor-icon-theme" "lz4" "minizip" "openal"
    "qt6-base" "qt6-declarative" "qt6-svg" "qt6-wayland" "xxhash" "ada"
    "rnnoise" "libpipewire" "libxtst" "libxrandr"
    "openssl" "protobuf" "glib2" "kcoreaddons" "openh264"
    "xcb-util-keysyms" "libjpeg" "libvpx" "opus" "zlib" "glibc" "gcc-libs" "libxcb" "libxext" "libxfixes" "libx11"
    "libxcomposite" "jemalloc" "libxdamage" "abseil-cpp" "libdispatch"
    # libtgvoip nimf rlottie in aur
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
    "fix-build-with-cppgir.diff"
)
declare -rAg _modules_name_map=(
    [cmake]=https://github.com/desktop-app/cmake_helpers/archive/7b11e62e2a40a3dab7f039d4953f1514c73cb6d5.tar.gz
    [cmake/external/Implib.so]=https://github.com/yugr/Implib.so/archive/0ddaa715d2572b100f8248c0fa4450fbf895be14.tar.gz
    [cmake/external/glib/cppgir]=https://gitlab.com/mnauw/cppgir/-/archive/9c4f5820d94d62ab451501f016bfea97156518f4/cppgir-9c4f5820d94d62ab451501f016bfea97156518f4.tar.gz
    [cmake/external/glib/cppgir/expected-lite]=https://github.com/martinmoene/expected-lite/archive/95b9cb015fa17baa749c2b396b335906e1596a9e.tar.gz
    [Telegram/codegen]=https://github.com/desktop-app/codegen/archive/0af136124083369073b8fdaf45f0816fd2b10bad.tar.gz
    [Telegram/lib_base]=https://github.com/desktop-app/lib_base/archive/fa02c719d19bc647bcde4ba172b72d05bacb6a79.tar.gz
    [Telegram/lib_crl]=https://github.com/desktop-app/lib_crl/archive/c1d6b0273653095b10b4d0f4f7c30b614b690fd5.tar.gz
    [Telegram/lib_lottie]=https://github.com/desktop-app/lib_lottie/archive/1a700e5a0d7c3e2f617530354ff2a47c5c72bb4a.tar.gz
    [Telegram/lib_qr]=https://github.com/desktop-app/lib_qr/archive/501f4c3502fd872ab4d777df8911bdac32de7c48.tar.gz
    [Telegram/lib_rpl]=https://github.com/desktop-app/lib_rpl/archive/8b1015d1bd57ef03fcd07a3eeddd3f5a9b688ade.tar.gz
    [Telegram/lib_spellcheck]=https://github.com/desktop-app/lib_spellcheck/archive/0b7622ff38778e9cd03d3997de59351973480a1f.tar.gz
    [Telegram/lib_storage]=https://github.com/desktop-app/lib_storage/archive/ccdc72548a5065b5991b4e06e610d76bc4f6023e.tar.gz
    [Telegram/lib_tl]=https://github.com/AyuGram/lib_tl/archive/11c8ae47ff9c9d69b0470700fff9ed924a97acd3.tar.gz
    [Telegram/lib_ui]=https://github.com/AyuGram/lib_ui/archive/817486ca25ba0c5a84c86cd73323fd3461cacfa1.tar.gz
    [Telegram/lib_webrtc]=https://github.com/desktop-app/lib_webrtc/archive/8751e27d50d2f26b5d20673e5ddba38e90953570.tar.gz
    [Telegram/lib_webview]=https://github.com/desktop-app/lib_webview/archive/c27c69953db52cfcb56abc3d422764f0fb4c2152.tar.gz
    [Telegram/ThirdParty/GSL]=https://github.com/desktop-app/GSL/archive/09938e870420b69a01f55c755207c871bc20b4e5.tar.gz
    [Telegram/ThirdParty/QR]=https://github.com/nayuki/QR-Code-generator/archive/720f62bddb7226106071d4728c292cb1df519ceb.tar.gz
    [Telegram/ThirdParty/cld3]=https://github.com/google/cld3/archive/b48dc46512566f5a2d41118c8c1116c4f96dc661.tar.gz
    [Telegram/ThirdParty/dispatch]=https://github.com/apple/swift-corelibs-libdispatch/archive/542b7f32311680b11b6fc8fcb2576955460ba7da.tar.gz
    [Telegram/ThirdParty/expected]=https://github.com/TartanLlama/expected/archive/292eff8bd8ee230a7df1d6a1c00c4ea0eb2f0362.tar.gz
    [Telegram/ThirdParty/fcitx5-qt]=https://github.com/fcitx/fcitx5-qt/archive/c743b12e6780edf1dcfe9071531c80f050cacb95.tar.gz
    [Telegram/ThirdParty/hime]=https://github.com/hime-ime/hime/archive/9b3e6f9ab59d1fe4d9de73d3bf0fed7789f921c5.tar.gz
    [Telegram/ThirdParty/hunspell]=https://github.com/hunspell/hunspell/archive/22c3381e2066bed616250d373fc5c935598b564a.tar.gz
    [Telegram/ThirdParty/jemalloc]=https://github.com/jemalloc/jemalloc/archive/54eaed1d8b56b1aa528be3bdd1877e59c56fa90c.tar.gz
    [Telegram/ThirdParty/kcoreaddons]=https://github.com/KDE/kcoreaddons/archive/fd84da51b554eac25e35b1e3f373edaab3029b15.tar.gz
    [Telegram/ThirdParty/kimageformats]=https://github.com/KDE/kimageformats/archive/106279d32ec4b93ccf5e29a92616e0f0cc8d2382.tar.gz
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

sha256sums=('1a8d1fcb44161f544eebcc89bc62a87aad56d96d6bf677ee6634f9e56548c6b9'
            'ee54bdf8fe67c8fadfffc794763fc62f4c6a15eb535c80ba7b1b74d6ec178882'
            'd0d4ea2fddcbc7d10ace2c37309feb09da87e8ce7ced6ce73592da1359f4765f'
            '72ecdcd66728a073ca9bfaa3662155c28530b8f61d2241c193c04d6f2ae3a8c6'
            '8b4ba7258685e49c9b7f2c60925264c3b2713805ad21304404d5f6b77cd5582b'
            'cbc1f4bf8c28ffeb89852eda7056ff6aa80d49cb45736a583c931d5ceeccdcdd'
            '3e7253b2cc31bdf68fa50d105715158e649812e5ad6b4f1f6e5fd1e89b3ffdfd'
            'c9aa4e32eb5e475d0826154055ff4749c07bb46d83b12f1641d31557e944a16f'
            'c7c39f293f89fae3b47e33b0803c73989a3fc6cf61aefc50e9384e8e25273331'
            'e9b050279a52e48f1fed56e76ed3995329b2f99518b6afba4f97ecb13088f935'
            'ecbb183303a4b49edda9836062e66f891781d29ffd223d6637180a6572fdb78f'
            '8569c9bf5495b19b76ce6e2e53f40604c8618429ce728bf73b2406d1382fdc94'
            '9b1afca339bd4e0579e73e92478ea26bb0c845dca7231de031e66c2f1a4ea5d9'
            '716fbe4fc85ecd36488afbbc635b59b5ab6aba5ed3b69d4a32a46eae5a453d38'
            '11b926f9605b258c35bd9ed806a10cab7ef5edd673ad53a014427b1c71d24a9e'
            '29bcc3c359378b83fda299ef1a0930886cb7937b893856ca476c47f90002ffa7'
            'fe3b18aecb849029b6af94922be0c25eee1b7b86565b1c8350692ed776cf42fb'
            'd1159a816ce96092b543f6ed421d84adaa9bc4853ab55f37383f78cdb2068bcd'
            '66dc8c843d99fb636b7bfe196f3038c7567c7395a698c820ca8c0d18a03ad497'
            '15a9981ab5e6a01f301609017aee11e000c22880d38b3be4e3da58c338f9b2fc'
            '855997c49f5f7263b8270662d03c8a1d5ba1868664a150e0f837679e2629a5ab'
            'ec25bbd47ba895684e9f9a3dfbb9aa96a7573c4c84455542be23998d5eb0fad8'
            '612b5d89f58a578240b28a1304ffb0d085686ebe0137adf175ed0e3382b7ed58'
            '996fdbcc6f99f44963c867a701bf8ab4179f32f3536ed32895a009ab569a4d66'
            '2b4c99261ab5db5b536c0aaf4e7ff406ab490aed04685c524c2251ed95dd426b'
            '976909135282818237954bce77b5b21f6c88f1bf34f749ef0be6ea2058ded207'
            'd80795686f3e58448c7b76830bb5c40847b7eaae1996c28f0422a029b66c2bb0'
            'aba69c97d466e82a13ae6c1d52628c7f7ec8f85c5224f8634fa26a313ebcc95f'
            'd0752fbb2ef6dc9dd1484252fe1027282019c74168da9ed7852abdf94fc5d73e'
            '2eaf5f6976f4c990ea2c2f8f8cd0f4ec22a935f799d6f901f10088845707a946'
            '52a2e052beb67492225a38213108f1d7edd1940fd025cad3a4ae28c57d428419'
            '41641c1a7e927662a6722a1d7df4c5f60d67fed9cc1f555b6be7d13d14542a68'
            '3d2eef00fd1739a652ef22f2d081497bc9ae71008ff6736945f2d2676cc6bba9'
            '73e639df3c73136eeb1890fc54acd603849fba01443005fd3c1a288539885792'
            '7665c8e87fdd52af5dad2d419dd452e71e3f6a30be2b419b07b57e0d50d18b53'
            '2736d6f36f9f90323f2a0ed6fa59f52b8be71f50939708dffb0eb9f8155bbde1'
            '0a62974efb496f62554626281f75470c067922dd01c48e01606d96e2a25175fe'
            'dd4118cb2c81a62fdfe8d4db5bf64c0bd6f21497a19ae505d4fa55027d909e1e'
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
    #error: ‘class gi::repository::Gio::Credentials’ has no member named ‘get_unix_pid’
    #https://github.com/telegramdesktop/tdesktop/issues/28454#issuecomment-2372735823
    patch -Np1 -d cmake/external/glib/cppgir -i "$srcdir/fix-build-with-cppgir.diff"
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
