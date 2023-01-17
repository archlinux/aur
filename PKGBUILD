pkgname=ueberzugpp
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "ninja" "cli11")
depends=("libvips" "xcb-util-image" "nlohmann-json")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('85c988a3498bff976f88dda3994998dc5658a4ae471a03b4da2b028903bc5cba')
provides=("ueberzug")

build() {
  cmake -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build -S "${pkgname}-${pkgver}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --config Release
}

# vim:set ts=2 sw=2 et:
