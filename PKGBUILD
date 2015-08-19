# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname=dmenu-pango-imlib
pkgver=4.5.3
pkgrel=2
pkgdesc="dmenu with pango and imlib support"
arch=('i686' 'x86_64')
url="https://github.com/Cloudef/dmenu-pango-imlib"
license=('GPL')
depends=('libx11' 'pango' 'imlib2')
makedepends=('unzip')
provides=('dmenu')
conflicts=('dmenu')
source=("https://github.com/Cloudef/$pkgname/archive/$pkgver.zip")
sha256sums=('ac2856500bfca809f2650e6e0cf958dfbf03ba01d2ca20a32fdc80d44711f2cc')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
