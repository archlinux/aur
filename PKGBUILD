# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=accounts-qml-module
pkgver=0.6+16.04.20151106
pkgrel=1
pkgdesc="Expose the Online Accounts API to QML applications"
url="https://launchpad.net/accounts-qml-module"
arch=(i686 x86_64)
license=(LGPL)
depends=(signond libaccounts-qt qt5-declarative)
makedepends=(qt5-tools)
source=("http://archive.ubuntu.com/ubuntu/pool/main/a/$pkgname/${pkgname}_$pkgver.orig.tar.gz")
md5sums=('f1d370ae9bd1b654949b8759d713fe45')

prepare() {
  mkdir -p build
}

build() {
  cd build 
  qmake-qt5 ../$pkgname-$pkgver/$pkgname.pro PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install_subtargets # skip docs
}

