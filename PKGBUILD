pkgname=ueberzugpp
pkgver=1.5.0
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json" "libsixel")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('45a9d71809ff932040ace0c16d83f1bbb8189ed6fb371ee00d3a2ec8b8a5838d')
provides=("ueberzug")
conflicts=("ueberzug")

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build -S "${pkgname}-${pkgver}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --config Release
}

# vim:set ts=2 sw=2 et:
