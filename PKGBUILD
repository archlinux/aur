# Maintainer: Peter Semiletov peter.semiletov at gmail dot com

pkgname=logfilegen
pkgver=3.0.2
pkgrel=1
pkgdesc="logfilegen is nginx/apache randomized log generator for testing purposes"
arch=('x86_64')
url="https://github.com/psemiletov/logfilegen"
license=('Public Domain')
depends=('gcc-libs' 'gcc' 'gzip' 'cmake')

source=(https://github.com/psemiletov/logfilegen/archive/$pkgver.tar.gz)


prepare() {
  mkdir -p "${srcdir}/logfilegen-${pkgver}/build"
}


build() {
  cd "${srcdir}/logfilegen-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package(){
  cd "${srcdir}/logfilegen-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}


md5sums=(357cb976f8777334da23564a9472c0c6)
