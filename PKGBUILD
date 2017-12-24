# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=sacd-decoder-bzr
pkgver=r31
pkgrel=1
pkgdesc="SACD decoder is a command line application which takes a Super Audio CD source and extracts a 24-bit high resolution wave file. It handles both DST and DSD streams. "
arch=('i686' 'x86_64')
url="https://tari.in/www/software/sacd/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('bzr')
source=("bzr+lp:/sacd/trunk")
md5sums=('SKIP')
pkgver() {
  cd $srcdir/trunk
  echo "r$(bzr revno)"
}
package() {
  cd $srcdir/trunk
  make
  make DESTDIR="${pkgdir}" install
}
