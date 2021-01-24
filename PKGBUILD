# $Id$
# Maintainer: Amish <contact at via dot aur>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libdaq-nfqueue
pkgver=3.0.0
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='https://www.snort.org/'
license=('GPL')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=("https://snort.org/downloads/snortplus/libdaq-${pkgver}.tar.gz")
sha512sums=('227f75f05cde9c5e551b2ca9915cce064e7b08bd6bfffca122ddc37c47cc97b45f6cbfae13f78eef48e7b2a857d54c77ec8c54c086665559d28051e77b5fac6f')
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
