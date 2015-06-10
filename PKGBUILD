# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipgrep
pkgver=2.0.0
pkgrel=2
pkgdesc="Display and Troubleshoot SIP signaling over IP networks in console"
arch=('i686' 'x86_64')
url="http://www.sipcapture.org/"
license=('GPL3')
depends=('pcre' 'libpcap')
source=(https://github.com/sipcapture/sipgrep/archive/${pkgver}.tar.gz)
sha256sums=('35b75ff94a27994004fb71e5668480d54236573905938f1f8ea726ad03978ef4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
