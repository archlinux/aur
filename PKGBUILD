# Maintainer: Thomas Pointhuber <thomas.pointhuber@gmx.at>
pkgname=openems
pkgver=0.0.34
pkgrel=1
pkgdesc="a free and open source EC-FDTD solver"
arch=('i686' 'x86_64')
url='http://openems.de'
license=('GPL3')
groups=()
depends=('qt4' 'tinyxml' 'hdf5' 'boost' 'vtk' 'unixodbc') 
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
sha256sums=('9ce8ecaaffe63cf8e1c839487a8ed2646c6cb98a0c0cbf38e00a52442630eb4a')

build() {
  cd "openEMS"
  ./update_openEMS.sh $(pwd)/bin/
}

package() {
  cd "openEMS/bin"

  install -d "$pkgdir/usr"
  cp -r * "$pkgdir/usr/"
}
