# Maintainer: Lufalas <lufalas at posteo dot com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=nudoku
pkgver=7.0.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL-3.0-only')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/jubalh/nudoku/archive/${pkgver}.tar.gz")
b2sums=('c8df1342fd33f8284e6983ddb5d869a752f485b444e316dcfef160a3d5eed3a9a8dcf3141fe3514a5f6c9de3d1d33236952f8c75b44070c5b92463e8b1db794d')

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
