# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=qjoypad
pkgver=4.3.1
pkgrel=1
pkgdesc='Program with a QT interface that converts gamepad/joystick events into key strokes and mouse actions in XWindows'
arch=('i686' 'x86_64')
url='https://github.com/panzi/qjoypad'
license=('GPL')
depends=('qt5-base' 'libxtst' 'qt5-x11extras')
makedepends=('qt5-tools' 'cmake')
install=${pkgname}.install
source=("https://github.com/panzi/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2aa11e6882696c85187ea5012cbd4aa4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
  make DESTDIR="$pkgdir/" install
}
