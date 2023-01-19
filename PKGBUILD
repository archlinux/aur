# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.4.8
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.4.8.tar.gz")
sha512sums=('05a459a3772e6d8b55902649dafaf8880fe7c67fdffced0dcd25da9e92e7600d4055f240e58bb01b3825cde68a02336053c7ed3f117cf56ebbf8913db21047da')

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

