# Maintainer: Thomas Pointhuber <thomas.pointhuber@gmx.at>
# Co-maintainer: Thorsten Liebig
pkgname=openems
pkgver=0.0.35
pkgrel=1
pkgdesc="a free and open source EC-FDTD solver"
arch=('i686' 'x86_64')
url='http://openems.de'
license=('GPL3')
groups=()
depends=('qt5-base' 'tinyxml' 'hdf5' 'boost' 'vtk' 'unixodbc' 'cgal')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://openems.de/download/src/openEMS-v$pkgver.tar.bz2")
noextract=()
sha256sums=('e5b514281466872c52f8f8509a712fd422d89269df7c02e4a6606f8f20757478')

build() {
  cd "openEMS"
  ./update_openEMS.sh $(pwd)/bin/
}

package() {
  cd "openEMS/bin"

  install -d "$pkgdir/usr"
  cp -r * "$pkgdir/usr/"
}
