# Maintainer: Auteiy <dmitry@auteiy.me>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=kotatogram-desktop
pkgver=1.1.1
pkgrel=1
pkgdesc="Experimental Telegram Desktop fork with option to select custom fonts."
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPL3)
depends=(
        ffmpeg
        hicolor-icon-theme
        minizip
        openal
        qt5-base
        qt5-imageformats
        openssl
        )
makedepends=(
        cmake
        git
        gyp
        range-v3
        python
        libappindicator-gtk3
        dos2unix
        )
optdepends=(
        'libnotify: desktop notifications'
        )
source=(
        "kdesktop::git+$url.git#tag=k$pkgver"
        "Catch2::git+https://github.com/catchorg/Catch2.git"
        "crl::git+https://github.com/telegramdesktop/crl.git"
        "GSL::git+https://github.com/Microsoft/GSL.git"
        "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
        "lz4::git+https://github.com/lz4/lz4.git"
        "rlottie::git+https://github.com/desktop-app/rlottie.git"
        "variant::git+https://github.com/mapbox/variant"
        "xxHash::git+https://github.com/Cyan4973/xxHash.git"
        "codegen::git+https://github.com/desktop-app/codegen.git"
        "lib_base::git+https://github.com/desktop-app/lib_base.git"
        "lib_crl::git+https://github.com/desktop-app/lib_crl"
        "lib_lottie::git+https://github.com/desktop-app/lib_lottie"
        "lib_rlottie::git+https://github.com/desktop-app/lib_rlottie"
        "lib_rpl::git+https://github.com/desktop-app/lib_rpl"
        "lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
        "lib_tl::git+https://github.com/desktop-app/lib_tl"
        "lib_ui::git+https://github.com/kotatogram/lib_ui.git"

        "CMakeLists.inj"
        "libtgvoip.patch"
        "no-gtk2.patch"
        "Revert-Change-some-private-header-includes.patch"
        "Revert-Disable-DemiBold-fallback-for-Semibold.patch"
        "tdesktop.patch"
        "tdesktop_lottie_animation_qtdebug.patch"
        "tg.protocol"
        "Use-system-wide-font.patch"
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
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'b759e45282c7bd04e1fdcbfd0c009773782bebde36d96363db9869a9d78e7fad41314ad311b7afbfa57db4e66c0265da17e9f81f6d62a972466cb71d19d4b47c'
        'd60694dc701aa985b0e82a12c9732b945082470441c687b33167a94f94efcf253baf43bb7280ec160ba338485ee5c62de138e4804cae05f27cc5cf4298166d39'
        '117b0c2bae3d3d3aa94d41382621be4e05c3314a2831dba59e1bcfb443e7b8ff4bcd0403544fa0cb6def85b444146bf59eef9da25f96b041d3ce8f5429b4a867'
        '087dd821690dfedf1c275f264a0223b123e31ab9ee95050023930470bc9c866958cae00e2fd9132e6f7efbc4f1dfc3fdc20f8fba1fc9472d92bd702eaa60adb0'
        'd5cd7ecb5583258462c21a9ae3d4e8ae8c709d47d7ce2c45f8ae23100d24993398b8372021957b9a4607b3988f366e1c0cf64d724d901cb70212665c481217e9'
        '218f8711eefb5a8115222e099e6d08fc4079584b3aa3594d05a43390f37d5b51fbf1b64511c3a3e7792ef6c32fa6f4c8a65b6188a9efbd340304602552f3a595'
        '79fcbee94f09df6b443c2b967afe4cba367985af13004b130da27f7bdf20974f76148a8056e98ce92000fabed80a1ff3cb2d332f6f8c70eed8aa909281533cd5'
        'b87414ceaae19185a8a5749cea1f6d9f3fc3c69b8dd729e3db8790cde00b987c3c827cd30baf0eac579d1884e34aa2f37bb90778c3c0bc9ca211d75a82891b9d'
        '2c1bb75449b4634befa3edaac5d20e4b29ede21119549d9a3895dda9d4723f618dd950ee32133e04186fa65d07f80081ba3e3d5585209ba9112aa754d06fbb5c'
        )
        

prepare() {
    cd "$srcdir/kdesktop"
        git submodule init
        
        git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch2"
        git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
        git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
        git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
        git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
        git config submodule.Telegram/ThirdParty/minizip.url "$srcdir/minizip"
        git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
        git config submodule.Telegram/ThirdParty/SPMediaKeyTap.url "$srcdir/SPMediaKeyTap"
        git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
        git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"
        
        git config submodule.Telegram/codegen.url "$srcdir/codegen"
        git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
        git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
        git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
        git config submodule.Telegram/lib_rlottie.url "$srcdir/lib_rlottie"
        git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
        git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
        git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
        git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"

        git submodule update

        dos2unix "$srcdir/kdesktop/.appveyor/install.bat"

        patch -Np1 -i "$srcdir/no-gtk2.patch"
        # patch -Np1 -i "$srcdir/Revert-Change-some-private-header-includes.patch"
        # patch -Np1 -i "$srcdir/Revert-Disable-DemiBold-fallback-for-Semibold.patch"
        # patch -Np1 -i "$srcdir/tdesktop_lottie_animation_qtdebug.patch"
        # patch -Np1 -i "$srcdir/Use-system-wide-font.patch"
        patch -Np1 -i "$srcdir/tdesktop.patch"

        unix2dos "$srcdir/kdesktop/.appveyor/install.bat"
        # disable static-qt for rlottie
        sed "/RLOTTIE_WITH_STATIC_QT/d" -i "$srcdir/kdesktop/Telegram/lib_rlottie/lib_rlottie.gyp"

        cd "$srcdir/kdesktop"
        cd "Telegram/ThirdParty/libtgvoip"
        patch -Np1 -i "$srcdir/libtgvoip.patch"
}

build() {
    cd "$srcdir/kdesktop"
        export LANG=en_US.UTF-8
        export GYP_DEFINES="DESKTOP_APP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION"
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
        cd "$srcdir/kdesktop/out/Release"
        cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -UTDESKTOP_OFFICIAL_TARGET
        make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
        install -m755 "$srcdir/kdesktop/out/Release/Telegram" "$pkgdir/usr/bin/kotatogram-desktop"

        install -d "$pkgdir/usr/share/applications"
        install -m644 "$srcdir/kdesktop/lib/xdg/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"

        install -d "$pkgdir/usr/share/kservices5"
        install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

        local icon_size icon_dir
        for icon_size in 16 32 48 64 128 256 512; do
            icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

                install -d "$icon_dir"
                install -m644 "$srcdir/kdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/kotatogram.png"
                done
}
