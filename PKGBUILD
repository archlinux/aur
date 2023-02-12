pkgname=ueberzugpp
pkgver=1.4.0
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "ninja" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json" "libsixel")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6f01a15920fa1d5a530626bca6a0f29b40cc65f71930e77950d52ab0d6af8ee0')
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
