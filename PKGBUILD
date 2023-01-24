# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.5.0
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.5.0.tar.gz")
sha512sums=('26ad59dcacc30fe4cf4cebbb23059e700c7a5f8f56160426030eb31b0c28c5caea1cdb7440ed95d3e0be8089f06d271d3ead40ad4be2296ae3c73ef023d23afe')

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

