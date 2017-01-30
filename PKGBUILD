# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator
pkgver=3.900
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url=http://www.veripool.org/projects/verilator/wiki/Intro
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gcc-libs')
makedepends=('gcc')

source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz")
md5sums=('5e2cacafdbf6d8d6af02bb94af868490')

build() {
  cd "verilator-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "verilator-${pkgver}"

  make install DESTDIR=$pkgdir
}
