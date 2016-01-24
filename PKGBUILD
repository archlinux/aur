# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.2b
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webengine')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('1d8d0848136ca94524b27889fadf0e7f')
sha512sums=('8f80e7f08ca15ab7778fd35a4531c1d51ca3a5d339391edc96ad627b4a149d48798411897fce10bb719d5be4fb5c5a99ee1c6ce59fe39b0cc919068b23a34c94')

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
