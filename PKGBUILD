# Maintainer: Berk Demirkır <berk at demirkir dot me>

_pkgname=qt4-serialport
pkgname=$_pkgname
pkgver=4.8.7
pkgrel=35
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='Qt4 Serial Port support'
depends=('qt4')
makedepends=()
source=("$_pkgname::git://code.qt.io/qt/qtserialport.git#branch=qt4-dev")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  qmake-qt4 qtserialport.pro
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 LICENSE* -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 LGPL* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
