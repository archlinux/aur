# Maintainer : Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=sofia-sip
pkgname=sofia-sip-bc
pkgver=1.13.45bc
pkgrel=1
pkgdesc="An open-source SIP User-Agent library"
arch=('x86_64')
url="http://sofia-sip.sourceforge.net"
options=('zipman')
license=('LGPL')
depends=('glib2' 'openssl')
provides=('sofia-sip')
conflicts=('sofia-sip')
source=("https://gitlab.linphone.org/BC/public/external/sofia-sip/-/archive/$pkgver/sofia-sip-$pkgver.tar.gz")
sha256sums=('12b4a28a3de90d06ea24927f8266a16f84974a132ce2965e3d5bd02dbdde942d')

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
