pkgname=pegtl
pkgver=2.7.1
pkgrel=1
pkgdesc="Parsing Expression Grammar Template Library"
license=('MIT')
arch=('any')
url="https://github.com/taocpp/PEGTL"
depends=()
makedepends=('cmake')
source=("https://github.com/taocpp/PEGTL/archive/${pkgver}.tar.gz")
sha256sums=('af68ee953d4efc48e090722f8cb9ad4ef1140f6a5443581563e003e060376718')

build() {
  cd PEGTL-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPEGTL_BUILD_EXAMPLES=OFF \
    -DPEGTL_BUILD_TESTS=OFF .
  make
}

package() {
  cd PEGTL-$pkgver
  make DESTDIR="$pkgdir" install
}

