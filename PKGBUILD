# Maintainer : Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=sofia-sip
pkgname=sofia-sip-bc
pkgver=1.13.16bc
pkgrel=1
pkgdesc="An open-source SIP User-Agent library"
arch=('i686' 'x86_64')
url="http://sofia-sip.sourceforge.net"
options=('zipman')
license=('LGPL')
depends=('glib2' 'openssl')
provides=('sofia-sip')
conflicts=('sofia-sip')
source=("https://github.com/BelledonneCommunications/sofia-sip/archive/$pkgver.tar.gz")
sha256sums=('f359e383ed56706285b192853c000cb45c2fa3e020a1e24df696396ba6ac5c19')

build() {
  cd "$_pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
