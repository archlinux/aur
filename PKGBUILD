# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.2.6
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webkit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('3dea1d4d8ae493682b0c540aff6e9041')
sha512sums=('7159c4d8c63a3f4a351fe04575447828b682617ed7682f8cea042831e827cda518f4e687882a2a9116112978340a9203a0f411265d5ab32873924a07a37555cd')

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
