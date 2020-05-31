# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=libdaq
pkgver=2.2.2
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='http://www.snort.org/'
license=('GPL')
depends=('libpcap')
makedepends=('ca-certificates')
source=(http://www.snort.org/downloads/archive/snortplus/daq-${pkgver}.tar.gz)
sha512sums=('7c5341853eff6d2f94cc0b0c38df03b3595c6b829581cbe756582c33de813fba018fa4a984e8ea66fbb2849e573d33bb1fbd23a77f4ac7e0f93fe66ff205c95d')

build() {
  cd "${srcdir}/daq-${pkgver}"
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${srcdir}/daq-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
