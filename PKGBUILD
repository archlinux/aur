pkgname=ueberzugpp
pkgver=2.7.0
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json" "libsixel" "openssl" "spdlog" "zeromq" "fmt")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f63346c7c9cb13f7f17d79ce9dff384bab2ae9d875861f9b02657956af98810c')
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
