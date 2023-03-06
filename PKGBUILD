# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.6.4
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.6.4.tar.gz")
sha512sums=('708c5e5cb1359b50619f51724962e3c00247612d7e5573ea7007e9aaebc4dd00943887d9bbf9a9898f29f4440a7e315c89901c3f070df4c9d166fa442edc8ec8')

build() {
    cd "${pkgname}"
	make
}

check() {
    cd "${pkgname}"
    make tests
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}

