pkgname=utena-launcher
pkgver=0.3.2
pkgrel=1.0
pkgdesc='launcher make by slint, hope I will get my revolution'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/launchre'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

build() {
  cd utena-launcher
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd utena-launcher
  DESTDIR="$pkgdir" ninja -C build install
}
