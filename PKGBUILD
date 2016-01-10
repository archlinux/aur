# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.3.0
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webkit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('7c118de4e59a876939f9c76684297fa7')
sha512sums=('29b3147a4a9273ecdfa9770ae8f5550a918f12d81ad6b0742eff6c011cce6b127466ae9aa5a6c42635fb70f8cc41cb00d896134cdbc3710aaea6daa6358e963f')

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
