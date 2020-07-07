# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-systems
pkgver=5.4.0.20181230
_commit=e3332ee38d27a134cef6621fdaf36687af1b6f4a
pkgrel=2
pkgdesc="Qt Publish and Subscribe Add-on Module"
arch=('x86_64')
url="https://github.com/qt/qtsystems"
license=('GPL3' 'LGPL' 'FDL')
depends=('bluez-libs' 'qt5-declarative')
source=("$pkgname-$_commit.tar.gz::https://github.com/qtproject/qtsystems/archive/$_commit.tar.gz")
sha256sums=('5259cf350e5e1f755c53bcba066dd40fea7b20f4e661b0973b24ae46454a9e75')

build() {
  cd qtsystems-$_commit

  qmake-qt5 CONFIG+=git_build
  make
}

package() {
  cd qtsystems-$_commit

  make INSTALL_ROOT="$pkgdir" install
}
