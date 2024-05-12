# Maintainer: Beyley Thomas <ep1cm1n10n123@gmail.com>
pkgname=lib32-libbass
pkgver=2.4.17
pkgrel=2
pkgdesc="BASS audio library (32-bit)"
arch=(x86_64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib)
source=(https://www.un4seen.com/files/bass24-linux.zip LICENSE)
md5sums=('91b04cdc2f29c79ff9f6108b8aa33486'
         '3ab2a50d2f88f284eb854a6a9a35f51f')

build () {
    unzip -q bass24-linux.zip -d "$srcdir/$pkgname-$pkgver"
}

package () {
    install -D -m644 "$startdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 libs/x86/libbass.so "$pkgdir/usr/lib32/libbass.so"
}
