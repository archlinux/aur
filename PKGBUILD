# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=nitrofs
pkgver=0.9.12
pkgrel=1
pkgdesc="Library for Nintendo DS homebrew development aka 'libfilesystem'"
arch=('any')
url="http://www.devkitpro.org"
license=('unknown')
depends=('libfat-nds')
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/libfilesystem-src-$pkgver.tar.bz2")
sha256sums=('34870f398905922c4f7f5a55e9a9edce0f3feae3a4b19a43ce8b4f2b76d0cfb6')

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  install -d "$DEVKITPRO"/libnds/{include,lib}
  make install
}
