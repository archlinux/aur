# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Félix Faisant <xcodexif@xif.fr>

set -u
pkgname='nopoll'
pkgver='0.4.3.b311'
pkgrel='1'
pkgdesc='Websocket library written in C'
arch=('i686' 'x86_64')
url='http://www.aspl.es/nopoll'
license=('LGPL')
depends=('openssl')
_verwatch=("${url}/downloads/" "nopoll-\(.*\)\.tar\.gz" 'l')
source=("http://www.aspl.es/nopoll/downloads/nopoll-${pkgver}.tar.gz")
sha256sums=('0df255f9d99a4b1537b6081d02cbb6491f014e0e30976b352058308ccaa4fcc6')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr' --enable-maintainer-mode
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j1
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u
