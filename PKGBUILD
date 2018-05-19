# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=inspectrum
pkgver=0.2.1
pkgrel=1
pkgdesc="SDR signal analyzer"
arch=('any')
url="https://github.com/miek/inspectrum"
license=(GPL)
depends=('qt5-base' 'fftw' 'liquid-dsp')
makedepends=('cmake' 'pkg-config')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("4baafa14b8a57cd3e460b4a11221a865c9fb97e0d8ead0adfa33fab93ac0339b")

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
