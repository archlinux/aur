# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.2.7
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webkit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('970254f1f21680fc4a3a1d7e27202c90')
sha512sums=('43a753f4ad86be8c9b71a758557714883e8a5fc7deb0461a1249f2602813e810f8387d10f90294b179dd111933e3712c98f92d343b9ea0a72cd4e723d826501c')

_pkgname=QSyncthingTray

build() {
  cd "$_pkgname-$pkgver/src"
  qmake-qt5 -config release
  make
}

package() {
  cd "$_pkgname-$pkgver/src"
  make install
  install -Dm755 binary/QSyncThingTray "$pkgdir/usr/bin/$_pkgname"
}
