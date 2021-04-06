# Maintainer: David Adler <d.adler@posteo.de>

pkgname=mx44
_pkgname=Mx44
pkgver=2
pkgrel=1
pkgdesc="4 x 4 phase and amplitude crossmodulating synthesizer"
arch=('x86_64')
url="https://web.archive.org/web/20190205234526/http://web.comhem.se/luna/"
license=('GPL2')
depends=('gtk2' 'jack')
source=("mx44::https://web.archive.org/web/20160730161851if_/http://web.comhem.se/luna/$_pkgname.$pkgver.tar.gz" "$pkgname.patch")
md5sums=('4d0b67a6ee54cc017df2712eee7b899e'
         'd897856c49d9bc589b430b3fe3292c2a')

prepare() {
	cd "$_pkgname.$pkgver/src"
    patch -p2 -i "$srcdir/$pkgname.patch"
}

build() {
	cd "$_pkgname.$pkgver/src"
	make
}

package() {
	cd "$_pkgname.$pkgver/src"
	make DESTDIR="$pkgdir/" PREFIX="/usr"  install
}
