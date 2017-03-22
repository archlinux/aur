# $Id$
# Maintainer: Volkan Gümüs <hallo@f1-computer.de>

pkgname=goaccess-ssl
pkgver=1.2
pkgrel=1
pkgdesc="An open source real-time web log analyzer and interactive viewer"
arch=('i686' 'x86_64')
url='http://goaccess.io'
license=('GPL')
depends=('ncurses' 'geoip' 'glib2' 'openssl')
backup=('etc/goaccess.conf')
source=("http://tar.goaccess.io/goaccess-$pkgver.tar.gz")
sha512sums=('bc31ef1e4c92608635856fa73e69b58267c161a7e3c6f2e3ca8860b862ed1c47575b93943dd975a5f8503774ee90ee0649d380563639e30908d876416638f889')

build() {
  cd goaccess-$pkgver
  ./configure --enable-geoip --enable-utf8 --with-openssl
  make prefix=/usr sysconfdir=/etc
}

package() {
  cd goaccess-$pkgver
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
}
