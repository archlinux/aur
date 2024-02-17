pkgname=ashpd-demo
pkgver=0.4.1
pkgrel=2.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita' 'libshumate')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/bilelmoussaoui/ashpd/releases/download/0.4.1-demo/ashpd-demo-0.4.1.tar.xz")
sha256sums=('e3d356db030b35993d5ae158edf5ff3fd2be9ac4e874f8c56df6d4f8f2a29793')

build() {
  cd $pkgname-${pkgver}
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd $pkgname-${pkgver}
  DESTDIR="$pkgdir" ninja -C build install
}
