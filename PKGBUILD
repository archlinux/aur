pkgname=sz
pkgver=2.1.5.1
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets)"
license=('custom')
arch=('x86_64')
url="https://collab.cels.anl.gov/display/ESR/SZ"
depends=('zstd')
makedepends=('cmake')
source=("https://github.com/disheng222/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('5234df442714f3400ed5676d2dd151386f6763471e52f784c640f840b8ce40d5')

build() {
  cd SZ-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        .
  make
}

package() {
  cd SZ-$pkgver
  make DESTDIR="$pkgdir" install
}

