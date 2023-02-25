pkgname=ueberzugpp
pkgver=2.2.1
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json" "libsixel" "botan" "spdlog" "zeromq")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3799b17e89c4415d421eeabf02b242bb43dd97d0dacdd541282dbd3b431858e4')
provides=("ueberzug")
conflicts=("ueberzug")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
