# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=inspectrum
pkgver=0.1
pkgrel=1
pkgdesc="SDR signal analyzer"
arch=('any')
url="https://github.com/miek/inspectrum"
license=(GPL)
depends=('qt5-base' 'fftw')
makedepends=('cmake' 'pkg-config')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("30eeec26166e41fe2d8007b0042420602d9920bcd4ccf0f74ea1fd64dfc93bfe")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
