pkgname=gdglight
pkgver=0.1.1
pkgrel=1.0
pkgdesc='rust impliment for light'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/gdglight'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df35759aa7539830ab3be1b61f42c3366f99cfe5561c5491b9812b239ceafaa5')

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
