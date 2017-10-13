# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator
pkgver=3.912
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url=http://www.veripool.org/projects/verilator/wiki/Intro
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gcc-libs')
makedepends=('gcc')

source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz")
sha256sums=('27c4a1174195bbd73c7965b018d83248cb9e780324f94066b05e72553548d064')

build() {
  cd "verilator-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "verilator-${pkgver}"

  make install DESTDIR="$pkgdir"
}
