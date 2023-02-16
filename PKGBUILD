pkgname=ueberzugpp
pkgver=1.7.0
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json" "libsixel")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e4e1d14b93805971268ca228f8bfc2c56aa0c1f1528d250c09a33446407258fe')
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
