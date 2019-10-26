# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=colpack
pkgver="1.0.10"
pkgrel=1
pkgdesc="A Graph Coloring Algorithm Package"
arch=('x86_64' 'i686')
url="https://cscapes.cs.purdue.edu/coloringpage"
license=('BSD-3')
depends=('gcc')
optdepends=()
makedepends=('cmake')
_pkgname=ColPack
source=(https://github.com/CSCsw/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('b22ead7da80fa1735291b2d83198adf41bf36101e4fcb2c4f07c1cfacf211c75')

_buildtype="Release"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  msg "Configuring"

  autoreconf -vif
  ./configure --prefix="/usr"

  msg "Building the project"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  msg "Installing files"
  make DESTDIR="${pkgdir}/" install
}
