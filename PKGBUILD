# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
# shellcheck disable=SC2034,2164,2154
pkgname=nudoku
pkgver=6.0.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/jubalh/nudoku/archive/${pkgver}.tar.gz")
b2sums=('ede9d603a6928837e9c1f88d57e660a01c72471706229e146db1c62db048c73c800223d6b01d7f01f77efd71418745eea8895269bba2e311a0cda71e4ac68039')

build() {
	cd "${pkgname}-${pkgver}"
		autoreconf -i
		./configure --prefix=/usr --enable-cairo
		make
}

package() {
	cd "${pkgname}-${pkgver}"
		make DESTDIR="${pkgdir}/" install
}
