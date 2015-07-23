# Contributor : mok <mok at ethetricks dot eu>

pkgname='ike-scan'
pkgver='1.9'
pkgrel='2'
pkgdesc='A tool that uses IKE protocol to discover, fingerprint and test IPSec VPN servers'
arch=('i686' 'x86_64')
url='http://www.nta-monitor.com/tools/ike-scan/'
license=('GPL')
depends=('openssl')
#makedepends=()
source=("http://www.nta-monitor.com/tools/ike-scan/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('05d15c7172034935d1e46b01dacf1101a293ae0d06c0e14025a4507656f1a7b6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --with-openssl
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s DESTDIR="${pkgdir}" install
}
