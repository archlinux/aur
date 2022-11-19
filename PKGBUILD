# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.2.0
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.2.0.tar.gz")
sha512sums=('419d9afb1bc31f228d27fca251a75a88e05c495e8147a0a9ce974e84096de1a0574a7f04a53b6061e5a9c7bc908f74efcedf69c77997455653d8c03f58a10e7a')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

