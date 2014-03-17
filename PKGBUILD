# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=lib32-libbass
pkgver=2.4.10
pkgrel=2
pkgdesc="BASS audio library (32-bit)"
arch=(x86_64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib)
source=(http://dl.un4seen.com/files/bass24-linux.zip LICENSE)
md5sums=('89dfde09729fffb34c0be2df4f646e48'
         '3ab2a50d2f88f284eb854a6a9a35f51f')

build () {
    unzip -q bass24-linux.zip -d "$srcdir/$pkgname-$pkgver"
}

package () {
    install -D -m644 "$startdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 libbass.so "$pkgdir/usr/lib32/libbass.so"
    install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
}
