# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.1.14
pkgrel=2
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://live.gnome.org/DFeet"
license=('GPL')
depends=('python2-dbus' 'pygtk' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('python2-distribute')
optdepends=('python-wnck: get icons for applications')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
md5sums=('15c9ff7277cae66738dc47642b910303')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
