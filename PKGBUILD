# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=vpr
pkgver=7.0
pkgrel=1
pkgdesc='Packing, Placement, Routing & Timing Analysis'
arch=(x86_64)
url='https://verilogtorouting.org'
license=(MIT)
depends=(ctags)
makedepends=(sed)
provides=(vpr)
conflicts=(vpr)
source=(http://www.eecg.utoronto.ca/vtr/vtr_release_7.0_full.tar.gz)
md5sums=('SKIP')

prepare() {
  # Extract
  tar -xvzf vtr_release_7.0_full.tar.gz  
  # Enable Graphics
  cd vtr_release/vpr
  sed -i 's/ENABLE_GRAPHICS = false/ENABLE_GRAPHICS = true/g' Makefile
}

package() {
  cd vtr_release/vpr
  make
  install -D vpr "$pkgdir"/usr/bin/vpr
}

