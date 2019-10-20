# $Id$
# Maintainer: Amish <contact at via dot aur>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libdaq-nfqueue
pkgver=2.0.6
pkgrel=3
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='https://www.snort.org/'
license=('GPL')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=(https://www.snort.org/downloads/snort/daq-${pkgver}.tar.gz)
md5sums=('67b915f10c0cb2f7554686cdc9476946')
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
