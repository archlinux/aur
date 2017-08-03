# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>

set -u
pkgname='jp2a'
pkgver='1.0.6'
pkgrel='3'
pkgdesc='A small utility for converting JPG images to ASCII'
arch=('i686' 'x86_64' 'armv7h')
#url='http://jp2a.sourceforge.net/'
url='https://github.com/cslarsen/jp2a'
license=('GPL')
depends=('curl' 'libjpeg')
source=("http://downloads.sourceforge.net/jp2a/jp2a-${pkgver}.tar.gz")
sha256sums=('0930ac8a9545c8a8a65dd30ff80b1ae0d3b603f2ef83b04226da0475c7ccce1c')

prepare(){
  set -u
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  set +u
}

build(){
  set -u
  cd "${pkgname}-${pkgver}"
  make
  set +u
}

check() {
  set -u
  cd "${pkgname}-${pkgver}"
  make test
  set +u
}

package(){
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
