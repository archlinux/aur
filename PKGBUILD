# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator
pkgver=3.884
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url=http://www.veripool.org/projects/verilator/wiki/Intro
arch=(any)
license=('LGPL')
depends=('gcc-libs')
makedepends=('gcc')

source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz")
md5sums=('cfc86a593aba5ec68dd2905b33edc905')

build() {
  cd "verilator-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "verilator-${pkgver}"

  make install DESTDIR=$pkgdir
}
