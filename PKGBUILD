# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.5.1
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.5.1.tar.gz")
sha512sums=('1de9dcedad1695d2fd38fdbae8381ba7e47c1597a1b875571e792e5de0d74e92bee276e23ed809d2b9104809ee81c6a2ea7b993aa5d599f4a260cd32eca87f0e')

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

