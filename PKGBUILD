pkgname=marine_greetd
_pkgname=marine_greetdm
pkgver=0.3.0
pkgrel=1.0
pkgdesc='A simple cli login dm just for wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/marine_greetdm'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/marine_greetdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c38e0a47d8a608d735d7cc55f48992a827a1bae4368e9585c16d9c6cdab7b3f1')

build() {
  cd ${_pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${_pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
