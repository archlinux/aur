# $Id$
# Maintainer: Amish <contact at via dot aur>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libdaq-nfqueue
pkgver=3.0.3
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='https://www.snort.org/'
license=('GPL')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=("libdaq-${pkgver}.tar.gz::https://github.com/snort3/libdaq/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('85b88e5dc5befd4076bfcfb08c3efdd3f7d3b3b96730c2baa30ea331320623ebcfbe49d7310f24a57607d54820cdbd6afc89891d793d6a01033b031daabbee0e')
provides=('libdaq')
conflicts=('libdaq')

build() {
  cd "${srcdir}/libdaq-${pkgver}"
  ./bootstrap
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${srcdir}/libdaq-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
