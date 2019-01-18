# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sam Burgos <jsbm1089 at gmail dot com>

_pkgname=blueberry
pkgname=blueberry-python3
pkgver=1.2.5
pkgrel=1
pkgdesc="Bluetooth configuration tool - Python 3 instead of 2"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('bluez-tools' 'gnome-bluetooth' 'python-dbus' 'python-gobject' 'python-setproctitle' 'rfkill')
conflicts=('blueberry')
provides=('blueberry')
source=($_pkgname-$pkgver.tar.gz::https://github.com/linuxmint/blueberry/archive/$pkgver.tar.gz
        https://github.com/linuxmint/blueberry/pull/66.patch)
sha256sums=('f9bb29a0b3db27c3d1e4d9d82c4b8656422a4ab12d07808cca6b0caaae35550f'
            '287e7956fc61f5dea56c282620579a26d0fbd9eec273b9f10c4c46723c32d831')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 <"$srcdir/66.patch"
}

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
