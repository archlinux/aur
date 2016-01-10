# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webengine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('939cb0f3bee4b35e9e0a1d055e6e4c32')
sha512sums=('d2258347fa3311d4de92d4bafdc60be613fa548c0353c3fe0f936d1dc923169a34712332c6d5ce90ac00188718cedbd6d1287c8427af7ea4c1586691968dd739')

_pkgname=QSyncthingTray

build() {
  cd "$_pkgname-$pkgver/src"
  qmake-qt5 -config release
  make
}

package() {
  cd "$_pkgname-$pkgver/src"
  install -Dm755 QSyncThingTray "$pkgdir/usr/bin/$_pkgname"
}
