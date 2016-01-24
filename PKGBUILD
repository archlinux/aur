# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.2b2
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webengine')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('08f1133f33985a7267cf9885893c69f0')
sha512sums=('7798120ea008664f1219eeb3b773b31d1907b9b5177ed028be911fa28b45ae342d21df7f27e1fd08d4482a8ce5c2118a43677c197f91e679be2e9709e86373cb')

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
