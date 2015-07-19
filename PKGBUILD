# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=libaec
pkgver=0.3.2
pkgrel=1
pkgdesc="Adaptive Entropy Coding library"
arch=(i686 x86_64)
url="https://www.dkrz.de/redmine/projects/aec"
license=('custom')
groups=(science)
depends=()
makedepends=(cmake)
source=(https://www.dkrz.de/redmine/attachments/download/453/${pkgname}-${pkgver}.tar.gz)
md5sums=('19c1211935d82d8b0bf581329634a6d7')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
