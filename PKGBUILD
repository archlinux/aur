pkgname=ashpd-demo
pkgver=0.3.0
pkgrel=1.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/bilelmoussaoui/ashpd/releases/download/0.3.0-demo/ashpd-demo-0.3.0.tar.xz")
sha256sums=('2d6094918bbbb912167bce40729af603abe71bca4d7e580c419c2cc5035aeac9')

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
