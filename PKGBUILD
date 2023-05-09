pkgname=gdgtui
_pkgname=batteryasjusttui
pkgver=0.2.0
pkgrel=2.0
pkgdesc='A simple battery saver tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/batteryasjusttui'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("gdgtui-v${pkgver}.tar.gz::https://github.com/Decodetalkers/batteryasjusttui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a6ea333959215987db3fcc4a17760b51c90967846df5f4c6583c175353563441')

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
