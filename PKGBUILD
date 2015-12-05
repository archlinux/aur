# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.2.5
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webkit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('dac694aac7f4e723020055fb3b8ebedb')
sha512sums=('9019ab26e7121bd06f4d116b9b0495e70f79bd737cbce313f434508bc768d8597be7f1aa865b76862ff96274ca6c1663df695614b748ec938ee30a59b8c67c82')

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
