# Maintainer : Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=sofia-sip
pkgname=sofia-sip-bc
pkgver=1.13.11bc
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
md5sums=('5a79be2baa08944da0eff6c759821e96')

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
