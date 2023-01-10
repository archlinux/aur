# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.4.6
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.4.6.tar.gz")
sha512sums=('410e2832e8620c1e757db464d78d893c15a6ecffb385fd4d3ebc4f3247f1a74c9d7366ac51d92f7afd3545588a3b161cd6d147583306a9312860bc44cda68793')

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

