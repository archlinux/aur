# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator
pkgver=3.902
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url=http://www.veripool.org/projects/verilator/wiki/Intro
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gcc-libs')
makedepends=('gcc')

source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz")
md5sums=('ddcde569983ef2ee815be804ad7f26a9')

build() {
  cd "verilator-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "verilator-${pkgver}"

  make install DESTDIR=$pkgdir
}
