# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Aleshus <aleshusi@gmail.com>

pkgname=sipp
pkgver=3.4.0
pkgrel=3
pkgdesc="A free Open Source test tool / traffic generator for the SIP protocol."
arch=('i686' 'x86_64')
url="http://sipp.sourceforge.net/"
license=('GPL')
depends=('openssl' 'libpcap' 'gsl')
source=(https://github.com/SIPp/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('6b3a7f7410cac7053500843afe0d0de1c9bd54b8557e09c502a1d4131ab1f986')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
	--with-openssl \
	--with-pcap \
	--with-rtpstream \
	--with-gsl
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
