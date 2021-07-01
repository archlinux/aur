pkgname=spectra09
pkgver=0.9.0
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('eigen')
makedepends=('cmake')
conflicts=('spectra')
provides=("spectra=${pkgver}")
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('2966757d432e8fba5958c2a05ad5674ce34eaae3718dd546c1ba8760b80b7a3d')

package() {
  cd spectra-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make install DESTDIR="$pkgdir"
}
