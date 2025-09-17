# Maintainer: Filipe Fernandes <fernandes.fd at gmail dot com>

pkgname=xssproxy
pkgver=1.1.2
pkgrel=1
pkgdesc="Forward freedesktop.org idle inhibition service calls to Xss."
arch=('x86_64')
url="https://github.com/vincentbernat/xssproxy"
license=('GPL3')
depends=('libxss' 'glib2' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vincentbernat/xssproxy/archive/v${pkgver}.tar.gz")
sha512sums=('940ef9b8f604b016acc73cda4bc41df7e39d66bc5f078f61cda256e0a577db2f51e4889df5f73303c89ca631336c823516a7934f680231ea16d56a6cb83842e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" bindir="/usr/bin" man1dir="/usr/share/man/man1" install
}
