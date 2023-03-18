pkgname=cpp-peglib
pkgver=1.8.3
pkgrel=1
pkgdesc="A single file C++ header-only PEG (Parsing Expression Grammars) library" 
license=('MIT')
arch=('any')
url="https://github.com/yhirose/cpp-peglib"
depends=('eigen')
makedepends=('cmake')
source=("https://github.com/yhirose/cpp-peglib/archive/v${pkgver}.tar.gz")
sha256sums=('3de8aeb44a262f9c2478e2a7e7bc2bb9426a2bdd176cf0654ff5a3d291c77b73')

package() {
  cd cpp-peglib-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=OFF .
  make install DESTDIR="$pkgdir"
}
