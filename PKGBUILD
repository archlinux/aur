# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.2
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webengine')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('7e0d18024a7cce2affea8545b6585d1e')
sha512sums=('64da73441fba6b4ab50e77bc472864c51e481560ea11bb2d5aa25ade0fa518c962ae78091c7a47e28dcd4ba0aace13817cf044efe3ce0749300009cecf602b88')

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
