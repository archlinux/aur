# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=librttopo-devel
_pkgname=librttopo
pkgver=1.1.0
_pkgver=1.1.0-RC1
pkgrel=2
pkgdesc="RT Topology Library"
url="https://git.osgeo.org/gitea/rttopo/librttopo"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('geos' 'proj')
makedepends=('cmake')
conflicts=('')
replaces=()
source=("https://git.osgeo.org/gitea/rttopo/librttopo/archive/librttopo-${_pkgver}.tar.gz")
md5sums=('049ad5a956f02212b05464ccba6b5577')

build() {
  cd "${srcdir}/${_pkgname}"
  
  ./autogen.sh
  ./configure --prefix="/usr"
  make
  make check
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
