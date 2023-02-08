pkgname=ueberzugpp
pkgver=1.1.0
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "ninja" "cli11")
depends=("opencv" "xcb-util-image" "nlohmann-json")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ad25d9b1e7e6702f03a30774960d003a9e72a52e8e697860bd38b7049c9f7164')
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
