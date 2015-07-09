# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=bluez-tools
pkgver=0.1.38
pkgrel=3
pkgdesc="A set of tools to manage bluetooth devices for linux from the cli"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license=('GPL')
depends=('dbus-glib')
makedepends=('bluez4')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver-662e.tar.gz)
md5sums=('8fbe1986d05d699b7d8078c2d5f3db5e')

build() {
  cd "$srcdir/$pkgname-$pkgver-662e"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver-662e"
  make DESTDIR="$pkgdir" install

}
