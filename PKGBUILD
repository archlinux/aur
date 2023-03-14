# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.6.6
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.6.6.tar.gz")
sha512sums=('f34c1aafc63105759e884721ce4c965b8a2b3619e5291f0ebf684e46b3cf1dc285d5b9180e664f07422f4161fa37eaf97b04b5d1a2a32749c7c27185e1a4786d')

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

