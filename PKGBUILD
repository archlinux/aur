# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname='libgse'
pkgver=1.0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Generic Stream Encapsulation library"
url="https://launchpad.net/libgse"
license=('LGPL3')
depends=('libpcap')
options=('!libtool')
source=("https://launchpad.net/libgse/1.0.x/${pkgver}/+download/gse-${pkgver}.tar.gz")
md5sums=('c9252083da16b356be8587d63d938df5')

build() {
  cd ${srcdir}/gse-${pkgver}
  ./configure --prefix=/usr \
              --disable-static
  make
}

check() {
  cd ${srcdir}/gse-${pkgver}
  make -k check
}

package() {
  cd ${srcdir}/gse-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
