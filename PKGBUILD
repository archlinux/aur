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
sha256sums=('ae01dd4f4a9b42631688a03d80e1c7d8d9b7c7187e236790267c96f926cbd962')

build() {
  cd "verilator-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "verilator-${pkgver}"

  make install DESTDIR=$pkgdir
}
