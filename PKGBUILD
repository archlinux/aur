pkgname=glfwm
pkgver=3.3
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
sha256sums=('dc5de5e9239de1bc4ecc0ebf3a4e0e45aaca1b5b26c7a93ae8b951971ca43c87')
