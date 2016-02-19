# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.3
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webengine')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('89c7ff5c4015296a6c379cd298580d5b')
sha512sums=('f891eabac9888d66c451b93a02a6b38bff60c050c531c9df8a02042cb963e287fe666ec1a973f423ff09766571937b9df9f3ce00f4318ac4434d95b4513548fc')

_pkgname=QSyncthingTray

build() {
  cd "$_pkgname-$pkgver"
  mkdir build
  cd build
  QTDIR=/usr/lib/qt cmake ..
  make
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
