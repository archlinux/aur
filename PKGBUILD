# Maintainer: Brian Bidulock <bidulock@openss7.org>
# $Id: PKGBUILD 102862 2013-12-22 20:59:29Z bpiotrowski $
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libdaq-static
_pkgname=libdaq
pkgver=2.0.1
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='http://www.snort.org/'
license=('GPL')
depends=('libpcap')
provides=('libdaq')
conflicts=('libdaq')
options=('!libtool' 'staticlibs')
makedepends=('ca-certificates')
source=(http://www.snort.org/dl/snort-current/daq-${pkgver}.tar.gz{,.sig})
md5sums=('044aa3663d44580d005293eeb8ccf175'
         'SKIP')

build() {
  cd "${srcdir}/daq-${pkgver}"
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${srcdir}/daq-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
