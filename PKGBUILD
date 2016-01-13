# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.1
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webengine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz")
md5sums=('243f5f1bced96ea5bbe723e77380b0dd')
sha512sums=('243a217b288b20be8bf6aa35579678621efd5ad97867e77a4907dcedcd7d9741d57d1c3b5e270830d5d30f38e378c64cb6eaac01e9252b4b4482b95ee345804c')

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
