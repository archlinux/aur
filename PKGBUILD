# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=accounts-qml-module
pkgver=0.7
pkgrel=2
pkgdesc="Expose the Online Accounts API to QML applications"
url="https://gitlab.com/accounts-sso/accounts-qml-module"
arch=(x86_64)
license=(LGPL)
depends=(signond libaccounts-qt qt5-declarative)
makedepends=(qt5-tools)
source=("https://gitlab.com/accounts-sso/$pkgname/repository/archive.tar.gz?ref=VERSION_$pkgver")
md5sums=('dfbfdd00f455ba9b4a110971118bf289')

prepare() {
  mkdir -p build
}

build() {
  cd build 
  qmake-qt5 ../$pkgname-*/$pkgname.pro PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install_subtargets # skip docs
}

