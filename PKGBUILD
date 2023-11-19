# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname='libgse'
pkgver=1.2.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Generic Stream Encapsulation library"
url="https://github.com/CNES/libgse"
license=('LGPL3')
depends=('libpcap')
options=('!libtool')
source=("https://github.com/CNES/libgse/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f4c37330a7c3eb392587aff54161875d338b03837d1471ee6e6e45fb115e71db')

build() {
  cd ${srcdir}/libgse-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
              --disable-static
  make
}

check() {
  cd ${srcdir}/libgse-${pkgver}
  make -k check
}

package() {
  cd ${srcdir}/libgse-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
