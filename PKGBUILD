# Maintainer: Lufalas <lufalas at posteo dot com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=nudoku
pkgver=8.0.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL-3.0-only')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/jubalh/nudoku/archive/${pkgver}.tar.gz")
b2sums=('4089390b1242c3727145d6034e7dac6218a3dc319b7225e8407b994b20238bde0fbce6810a005d942f875e8e767afbf947a7618b200db8ee59b647a2ba67b765')

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
