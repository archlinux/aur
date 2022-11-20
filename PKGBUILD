pkgname=gdgbatterysaver
pkgver=0.1
pkgrel=1.0
pkgdesc='Green Dam Girl control battery'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/gdbbatterysaver'
license=('MIT-2.0')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

build() {
  cd gdgbatterysaver
  meson build \
    -Dprefix=/usr \
    -Dbuildtype=release
  ninja -C build
}

package() {
  cd gdgbatterysaver
  DESTDIR="$pkgdir" ninja -C build install
}
