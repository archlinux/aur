# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
pkgname=inspectrum
pkgver=0.2.2
pkgrel=1
pkgdesc="SDR signal analyzer"
arch=('any')
url="https://github.com/miek/inspectrum"
license=('GPL')
depends=('qt5-base' 'fftw' 'liquid-dsp')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9e513101a59822c86b84cb7717f395c59bb27a6c192fe021cf4ffb7cf1d09c78')

build() {
  mkdir -p "$srcdir"/$pkgname-$pkgver/build
  cd "$srcdir"/$pkgname-$pkgver/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
