pkgname=ashpd-demo-git
pkgver=0.4.0
pkgrel=1.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'ninja' 'meson' 'rust' 'qt5-base')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
  cd $pkgname/ashpd-demo
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd $pkgname/ashpd-demo
  DESTDIR="$pkgdir" ninja -C build install
}
