pkgname=ashpd-demo
pkgver=0.4.0
pkgrel=1.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/bilelmoussaoui/ashpd/releases/download/0.4.0-demo/ashpd-demo-0.4.0.tar.xz")
sha256sums=('345f8baaeab64af5dc2ef902cbf705a290f2ad10d6168a442886159eb3345010')

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
