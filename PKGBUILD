# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
# shellcheck disable=SC2034,2164,2154
pkgname=nudoku
pkgver=5.0.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/jubalh/nudoku/archive/${pkgver}.tar.gz")
b2sums=('3bf0385e685a76e07d3110a566cfd7544655f5b1f6423659956220c81cb1c5d114bd5521c7853a365ec65a373725c7ba8b465b3da1452cd820201e95a033192d')

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
