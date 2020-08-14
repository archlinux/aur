# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=sacd-decoder-bzr
pkgver=r37
pkgrel=1
pkgdesc="SACD decoder is a command line application which takes a Super Audio CD source and extracts a 24-bit high resolution wave file. It handles both DST and DSD streams. "
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://tari.in/www/software/sacd/"
license=(GPL3)
depends=(gcc-libs)
makedepends=(bzr python-dulwich)
source=("sacd-decoder::bzr+lp:/sacd/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-bzr/}"
  echo "r$(bzr revno)"
}

build() {
  cd "${pkgname/-bzr/}"
  make
}

package() {
  cd "${pkgname/-bzr/}"
  make DESTDIR="${pkgdir}" install
}
