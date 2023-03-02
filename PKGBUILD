# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.6.3
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.6.3.tar.gz")
sha512sums=('c15d2d1b26e023be05c10d6209e81b5f7e3678ef721283546ed697504d0fa42d3868c68aaf9d1cc1a3388d2c27dba8af3848cd3c82e228fac3576210a2c4ca2b')

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

