# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
# shellcheck disable=SC2034,2164,2154
pkgname=nudoku
pkgver=4.0.1
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/jubalh/nudoku/archive/${pkgver}.tar.gz")
b2sums=('d13a9fbb5b4501352991f37ffacba09bbf707cee032736fa0b2482e9c1a485a35b7b0a94eabba5f8cbe328ddca3ee653b883939037a42f83388a7bf0513fae46')

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
