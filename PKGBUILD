# Maintainer : Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=sofia-sip
pkgname=sofia-sip-bc
pkgver=1.13.41bc
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
sha256sums=('299bd7e4a45267fef5f22d820c479e6fda45c41fe0d8bce381359aa780cd7013')

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
