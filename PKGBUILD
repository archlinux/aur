# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Xavier Devlamynck <magicrhesus at ouranos dot be>

pkgname=sipgrep
pkgver=2.1.0
pkgrel=1
pkgdesc="Display and Troubleshoot SIP signaling over IP networks in console"
arch=('i686' 'x86_64')
url="https://www.sipcapture.org/"
license=('GPL3')
depends=('pcre' 'libpcap')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/sipcapture/sipgrep/archive/${pkgver}.tar.gz")
sha256sums=('72ac17c734c404125ee20d552edf64f7a02bfa5d39fc70f2fd8fe944fdf1e632')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-ipv6
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
