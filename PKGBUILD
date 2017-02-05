# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=nitrofs
pkgver=0.9.13.1
pkgrel=1
pkgdesc="Library for Nintendo DS homebrew development aka 'libfilesystem'"
arch=('any')
url="http://devkitpro.org"
license=('unknown')
depends=('libfat-nds')
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/libfilesystem-src-0.9.13-1.tar.bz2")
sha256sums=('b03dd97bbeafa5da74c36f7bc1a42e6cb08b0dd4ab3c039ce593eab4141d985a')

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  install -d "$DEVKITPRO"/libnds/{include,lib}
  make install
}
