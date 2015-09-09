# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Félix Faisant <xcodexif@xif.fr>

set -u
pkgname='nopoll'
pkgver='0.3.2.b232'
pkgrel='1'
pkgdesc='Websocket library written in C'
arch=('i686' 'x86_64')
url='http://www.aspl.es/nopoll/'
license=('LGPL')
depends=('openssl')
source=("http://www.aspl.es/nopoll/downloads/nopoll-${pkgver}.tar.gz")
sha256sums=('a1a25dcfe8406fcd355568ab0331f24eeec011a7b272df7b34a16db4a283b834')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr' --enable-maintainer-mode
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u
