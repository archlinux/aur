# Maintainer: Sameer Hoosen <tabhooked@gmail.com>
# Official package maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Based on telegram-desktop-dev by: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: hexchain <i@hexchain.org>

# Thanks to Dan Elkouby <streetwalrus@codewalr.us> for some of the custom patch ideas!
# https://github.com/Streetwalrus/dotfiles/blob/master/scripts/telegram-desktop

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-udf-patched
pkgver=1.8.15
pkgrel=1
pkgdesc='Telegram Desktop client with several personal patches'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats' 'openssl')
makedepends=('cmake' 'git' 'gyp' 'range-v3' 'python' 'libappindicator-gtk3' 'dos2unix')
optdepends=(
    'libnotify: desktop notifications'
    'ttf-opensans: default Open Sans font family'
)
provides=('telegram-desktop')
conflicts=('telegram-desktop')
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=v$pkgver"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
    "variant::git+https://github.com/mapbox/variant"
    "Catch2::git+https://github.com/catchorg/Catch2.git"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "crl::git+https://github.com/telegramdesktop/crl.git"
    "xxHash::git+https://github.com/Cyan4973/xxHash.git"
    "rlottie::git+https://github.com/john-preston/rlottie.git"
    # Files from the official package
    "tg.protocol::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/tg.protocol"
    "CMakeLists.inj::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/CMakeLists.inj"
    "tdesktop.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/tdesktop.patch"
    "no-gtk2.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/no-gtk2.patch"
    "libtgvoip.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/libtgvoip.patch"
    "Revert-Disable-DemiBold-fallback-for-Semibold.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/Revert-Disable-DemiBold-fallback-for-Semibold.patch"
    "Use-system-wide-font.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/Use-system-wide-font.patch"
    "tdesktop_lottie_animation_qtdebug.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/tdesktop_lottie_animation_qtdebug.patch"
    "Revert-Change-some-private-header-includes.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/Revert-Change-some-private-header-includes.patch"
    # Custom patches
    "always_delete_for_everyone.patch"
    "always_clear_history_for_everyone.patch"
    "always_pin_without_notify.patch"
    "always_send_as_photo_or_album.patch"
)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    # Official files
    'b87414ceaae19185a8a5749cea1f6d9f3fc3c69b8dd729e3db8790cde00b987c3c827cd30baf0eac579d1884e34aa2f37bb90778c3c0bc9ca211d75a82891b9d'
    'b759e45282c7bd04e1fdcbfd0c009773782bebde36d96363db9869a9d78e7fad41314ad311b7afbfa57db4e66c0265da17e9f81f6d62a972466cb71d19d4b47c'
    '218f8711eefb5a8115222e099e6d08fc4079584b3aa3594d05a43390f37d5b51fbf1b64511c3a3e7792ef6c32fa6f4c8a65b6188a9efbd340304602552f3a595'
    '117b0c2bae3d3d3aa94d41382621be4e05c3314a2831dba59e1bcfb443e7b8ff4bcd0403544fa0cb6def85b444146bf59eef9da25f96b041d3ce8f5429b4a867'
    'd60694dc701aa985b0e82a12c9732b945082470441c687b33167a94f94efcf253baf43bb7280ec160ba338485ee5c62de138e4804cae05f27cc5cf4298166d39'
    'd5cd7ecb5583258462c21a9ae3d4e8ae8c709d47d7ce2c45f8ae23100d24993398b8372021957b9a4607b3988f366e1c0cf64d724d901cb70212665c481217e9'
    '2c1bb75449b4634befa3edaac5d20e4b29ede21119549d9a3895dda9d4723f618dd950ee32133e04186fa65d07f80081ba3e3d5585209ba9112aa754d06fbb5c'
    '79fcbee94f09df6b443c2b967afe4cba367985af13004b130da27f7bdf20974f76148a8056e98ce92000fabed80a1ff3cb2d332f6f8c70eed8aa909281533cd5'
    '087dd821690dfedf1c275f264a0223b123e31ab9ee95050023930470bc9c866958cae00e2fd9132e6f7efbc4f1dfc3fdc20f8fba1fc9472d92bd702eaa60adb0'
    # Custom patches
    'e88fa96024efc6176c818d0a46684e0ee1fb3a7bdadb323ad3b29f736209c80b6c31b135cf84389e7e2bbd614e57b241e4437c94b6fd114e73cfc418bf130015'
    '4a7e9de924bbf32fb4cd24ffa2764bcf49e0540bba649829b180da20a62810d4a21ebf11529d4eca22c9ceaa93b434ca3fbfd0b636795f8109ea4e1eddbff8f3'
    'b4eeeb4b2801f3edcc7423f28403b1dfabd3f3869425e4f102a2a4554bde93e63bd73d2d4dbf3e5748ce831b570e441d3917f532fc5cceac1ee5e8fd0832cb30'
    '650a2a2568cacd2775979614c06c90a4c505207246eb229bbf4fccd8e9fc2540093eaa5bd748e3801c1e1b43beb89b19674c27c5f400d451475b0ee068b04ca2'
)

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch2"
    git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
    git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"
    git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
    git submodule update

    dos2unix "$srcdir/tdesktop/.appveyor/install.bat"

    patch -Np1 -i "$srcdir/tdesktop.patch"
    patch -Np1 -i "$srcdir/no-gtk2.patch"
    patch -Np1 -i "$srcdir/Revert-Disable-DemiBold-fallback-for-Semibold.patch"
    patch -Np1 -i "$srcdir/tdesktop_lottie_animation_qtdebug.patch"
    patch -Np1 -i "$srcdir/Revert-Change-some-private-header-includes.patch"
    patch -Np1 -i "$srcdir/Use-system-wide-font.patch"

    # custom patches
    patch -Np1 -i "$srcdir/always_delete_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_clear_history_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_pin_without_notify.patch"
    patch -Np1 -i "$srcdir/always_send_as_photo_or_album.patch"

    unix2dos "$srcdir/tdesktop/.appveyor/install.bat"

    # disable static-qt for rlottie
    sed "/RLOTTIE_WITH_STATIC_QT/d" -i "$srcdir/tdesktop/Telegram/gyp/lib_rlottie.gyp"

    cd "$srcdir/tdesktop"
    cd "Telegram/ThirdParty/libtgvoip"
    patch -Np1 -i "$srcdir/libtgvoip.patch"
}

build() {
    cd "$srcdir/tdesktop"
    export LANG=en_US.UTF-8
    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION,TDESKTOP_FORCE_GTK_FILE_DIALOG"
    export EXTRA_FLAGS="-Winvalid-pch"
    export CPPFLAGS="$CPPFLAGS $EXTRA_FLAGS"
    export CXXFLAGS="$CXXFLAGS $EXTRA_FLAGS"

    # Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
    # See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
    # https://github.com/telegramdesktop/tdesktop/issues/4717
    # The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".
    # We're going to use the defaults for now but might at some point use the official ones from the official binaries as noted above.

    gyp \
        -Dapi_id=17349 \
        -Dapi_hash=344583e45741c457fe1862106095a5eb \
        -Dbuild_defines=${GYP_DEFINES} \
        -Gconfig=Release \
        --depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegram.gyp --format=cmake
    NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
    sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
    cd "$srcdir/tdesktop/out/Release"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -UTDESKTOP_OFFICIAL_TARGET 
    make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/tdesktop/out/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/tdesktop/lib/xdg/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram.png"
    done
}
