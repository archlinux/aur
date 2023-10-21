pkgname=marine_greetd
_pkgname=marine_greetdm
pkgver=0.3.1
pkgrel=1.0
pkgdesc='A simple cli login dm just for wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/marine_greetdm'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/marine_greetdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c21bed49defbc68e87c93f4f429eac37807588f1200c1e51303f194f0a3a029')

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
