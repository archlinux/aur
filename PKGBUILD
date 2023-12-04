# Maintainer: Ferdinand "yrlf" Bachmann <theferdi265@gmail.com>
pkgname=libbass_fx
pkgver=2.4.12.6
pkgrel=4
pkgdesc="BASS audio library - Effects Add-On"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib unzip libbass)

source=(
    https://www.un4seen.com/files/z/0/bass_fx24-linux.zip
    LICENSE
)
sha256sums=('1ee97610bc2768357c4c344c0d7a058ac95edf51804c391fdcf7644762bd413b'
            'f7bc36320110c8fd2f87c6d2bb5df6d2231ca9ab31a299b1565de63f7681cc83')

package() {
    case "$CARCH" in
        i686)
            install -D -m644 libs/x86/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
            ;;
        armv6h|armv7h)
            install -D -m644 libs/armhf/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
            ;;
        aarch64|x86_64)
            install -D -m644 libs/$CARCH/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
            ;;
    esac

    install -D -m644 C/bass_fx.h "$pkgdir/usr/include/bass_fx.h"
    install -D -m644 bass_fx.chm "$pkgdir/usr/share/doc/libbass/bass_fx.chm"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
