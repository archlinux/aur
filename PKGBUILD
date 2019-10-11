# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=librttopo
pkgver=1.1.0
pkgrel=1
pkgdesc="RT Topology Library"
url="https://git.osgeo.org/gitea/rttopo/librttopo"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('geos' 'proj')
makedepends=('cmake')
conflicts=('')
replaces=()
source=("https://git.osgeo.org/gitea/rttopo/librttopo/archive/librttopo-${pkgver}.tar.gz")
md5sums=('0952b78943047ca69a9e6cbef6146869')

build() {
  cd "${srcdir}/${pkgname}"
  
  ./autogen.sh
  ./configure --prefix="/usr"
  make -j2
  make check
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
