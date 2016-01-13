# $Id$
# Maintainer: Sérgio Martins <iamsergio@gmail.com>

pkgname=flow-pomodoro
pkgver=1.0.2
pkgrel=1
pkgdesc="A sticky task manager and pomodoro that blocks distractions."
arch=('i686' 'x86_64')
url="https://github.com/iamsergio/flow-pomodoro"
license=('GPL')
depends=('qt5-base>=5.4.0' 'qt5-declarative>=5.4.0' 'qt5-quickcontrols>=5.4.0')
makedepends=('qt5-base>=5.4.0' 'qt5-declarative>=5.4.0' 'qt5-quickcontrols>=5.4.0')

source=(https://github.com/iamsergio/flow-pomodoro/archive/v${pkgver}.zip)
sha1sums=('7026c655c035374c29e76c619b9aaefcca6e286a')

build() {
  mkdir -p ${pkgname}-${pkgver}/build
  cd ${pkgname}-${pkgver}/build
  qmake ../flow.pro
  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  make INSTALL_ROOT=$pkgdir/usr/ install
}
