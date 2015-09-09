# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='nethub'
pkgver='1.1'
pkgrel='1'
pkgdesc='multiple connection line based single domain or TCP socket network repeater, can work with socat or netcat'
url="https://github.com/fmang/${pkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('gcc' 'make')
_verwatch=("http://www.mg0.fr/pub/c/" "${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
source=("http://mg0.fr/pub/c/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f9d30c20cf57e0dfb57bb8d5216b70c516933fcb5d25a559374bc40995a70108')

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" install
  set +u
}
set +u
