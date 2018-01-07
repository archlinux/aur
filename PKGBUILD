# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libdaq
pkgver=2.0.6
pkgrel=2
pkgdesc='Data Acquisition library for packet I/O.'
arch=('x86_64')
url='http://www.snort.org/'
license=('GPL')
depends=('libpcap')
makedepends=('ca-certificates')
source=(http://www.snort.org/downloads/snort/daq-${pkgver}.tar.gz)
md5sums=('2cd6da422a72c129c685fc4bb848c24c')

build() {
  cd "${srcdir}/daq-${pkgver}"
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${srcdir}/daq-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
