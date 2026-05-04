# Maintainer: Torikul Habib <torik.habib@gmail.com>
pkgname=gabutytb
pkgver=1.0.1
pkgrel=1
pkgdesc="Frontend of YT-DLP built with GTK4 for Gabut Download Manager"
arch=('x86_64')
url="https://github.com/gabutakut/gabutytb"
license=('LGPL2.1')
depends=(
  'python3'
  'gtk4'
)
makedepends=(
  'meson'
  'ninja'
  'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabutakut/gabutytb/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6776f6d0f1a555237996d0a9c3eb8f8141c00e74715fb2dd87d0c63ac3f41aaa')

build() {
  cd "$pkgname-$pkgver"
  meson setup build \
    --prefix=/usr \
    --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
}
