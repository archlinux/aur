pkgname=ueberzugpp
pkgver=1.3.0
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "ninja" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5ffe6e165839aba9d60daeb55dde79b9bcbc809e036704b12d63696c4a7d137f')
provides=("ueberzug")
conflicts=("ueberzug")

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
