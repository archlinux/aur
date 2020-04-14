# $Id$
# Maintainer: Amish <contact at via dot aur>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libdaq-nfqueue
pkgver=2.2.2
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='https://www.snort.org/'
license=('GPL')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=(https://www.snort.org/downloads/snortplus/daq-${pkgver}.tar.gz)
md5sums=('c61f60674a5f951f0c50faf33a611fee')
provides=('libdaq')
conflicts=('libdaq')

build() {
  cd "${srcdir}/daq-${pkgver}"
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${srcdir}/daq-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
