# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.1.2
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.1.2.tar.gz")
sha512sums=('dc4de164c24fc99d682316832fff23a6dc527562ff760d1e0d1a010ec27b09f00b378d8e03da9b07f32c10f3cd7950c21c79a0ce03b1c3d8f6799a4c1075ad8e')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

