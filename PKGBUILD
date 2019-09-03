# Maintainer: Nicola Mori <nicolamori (at) aol (dot) com>

pkgname=qtscriptbindings
pkgver=0.1
pkgrel=1
pkgdesc="Qt bindings for Qt script (extracted from qcad)"
arch=('x86_64')
url="https://github.com/qcad/qcad"
license=('GPLv3')
depends=('qt5-base' 'qt5-script' 'qt5-svg' 'qt5-xmlpatterns' 'qt5-tools')
source=("https://github.com/qcad/qcad/archive/v3.23.0.0.zip")
md5sums=('026e8e2dd1be0cd0331deb2bd096a11c')

build() {
  
  cd qcad-3.23.0.0/src/3rdparty/qt-labs-qtscriptgenerator-5.5.0/
  qmake
  make

}

package() {

  mkdir -p ${pkgdir}/usr/lib/qt/plugins/script
  install ${srcdir}/qcad-3.23.0.0/plugins/script/* ${pkgdir}/usr/lib/qt/plugins/script

}
