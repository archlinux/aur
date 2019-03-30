# Contributer: giacomogiorgianni@gmail.com 

pkgname=crosti
pkgver=1.14.0
pkgrel=2
pkgdesc="Graphic conversion utility to create cross stitches"
arch=(any)
url="https://sites.google.com/site/crostiapp/"
license=('GPL')
depends=('qt4')
#source=("http://netcologne.dl.sourceforge.net/project/crosti/crosti%201.8.1/${pkgname}-${pkgver}-source.zip")
source=("http://sourceforge.net/projects/crosti/files/crosti%20${pkgver}/${pkgname}-${pkgver}-source.zip")
md5sums=('2e705d21e13279be63d41513c241913c')

build() {
  cd "${srcdir}"

  qmake-qt4 $pkgname.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname"

  make
}

package() { 
	cd "${srcdir}"
	make INSTALL_ROOT=${pkgdir} install
}

