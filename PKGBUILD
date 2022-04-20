# Maintainer: taep96 <taep96@cock.li>
pkgname=libbassmix
pkgver=2.4.11.2
pkgrel=1
pkgdesc="An extension providing the ability to mix together multiple BASS channels, with resampling and matrix mixing features. Also provides the ability to split a BASS channel into multiple channels."
arch=(x86_64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib libbass)

source=("$pkgname-$pkgver.zip::https://www.un4seen.com/files/bassmix24-linux.zip")

sha256sums=('a69092d10d33700991f27df6619c8906b061de4377c8614ef0389dee688c59fb')

prepare() {
    grep Lic "$srcdir/bassmix.txt" -A14 > LICENSE
}

package() {
    install -D -m755 x64/libbassmix.so "$pkgdir/usr/lib/libbassmix.so"

    install -D -m644 bassmix.h "$pkgdir/usr/include/bassmix.h"
    install -D -m644 bassmix.chm "$pkgdir/usr/share/doc/libbass/bassmix.chm"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
