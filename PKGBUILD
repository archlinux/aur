pkgname=pegtl
pkgver=2.7.0
pkgrel=1
pkgdesc="Parsing Expression Grammar Template Library"
license=('MIT')
arch=('any')
url="https://github.com/taocpp/PEGTL"
depends=()
makedepends=('cmake')
source=("https://github.com/taocpp/PEGTL/archive/${pkgver}.tar.gz")
sha256sums=('62f870ccb405452ff6037861f466e8c4a02290e7a4560986f79b0a3acb5d13b6')

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

