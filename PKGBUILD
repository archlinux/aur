# Maintainer: Lufalas <lufalas at posteo dot com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=nudoku
pkgver=8.0.1
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL-3.0-only')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jubalh/nudoku/archive/${pkgver}.tar.gz")
b2sums=('7714ab6b659317e36223b19dfc48df112c8b642b4400bbe2335ed37f08b25532d957d9f92731b699c7859807bfb2f34ceffaa147d358ec7a24f64aea9e47013b')

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
