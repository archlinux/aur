# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.1.15
pkgrel=2
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://live.gnome.org/DFeet"
license=('GPL')
depends=('python2-dbus' 'pygtk' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('python2-distribute')
optdepends=('python2-wnck: get icons for applications')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1250d353ded2c2635fb97d26a7fb9e68aba0f851a7f2d5608de651fa14f8eb0a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
