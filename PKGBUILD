pkgname=glfwm
pkgver=3.4
pkgrel=1
pkgdesc="GLFW Manager - C++ wrapper with multi-threading"
arch=('i686' 'x86_64')
url="https://github.com/giorgiomarcias/glfwm"
license=('zlib')
depends=(
  'glfw'
  'cmake'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/giorgiomarcias/glfwm/archive/v${pkgver}.tar.gz")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
sha256sums=('43e20f3fca07e40eb119fb1c9030a0eba499d0aee6d446f8f9dbc33f40b602c9')
