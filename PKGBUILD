pkgname=marine_greetd
_pkgname=marine_greetdm
pkgver=0.1.0
pkgrel=1.0
pkgdesc='A simple cli login dm just for wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/marine_greetdm'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/marine_greetdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1c3c98fb630aadc5ef16cc0b8bf1cff26b6f19a69aebe441da1ed1f6f45b74cd')

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
