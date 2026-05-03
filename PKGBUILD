# Maintainer: Torikul Habib <torik.habib@gmail.com>
pkgname=gabutytb
pkgver=1.0.0
pkgrel=1
pkgdesc="Frontend of YT-DLP built with GTK4 for Gabut Download Manager"
arch=('x86_64')
url="https://github.com/gabutakut/gabutytb"
license=('LGPL2.1')
depends=(
  'python3'
  'python3-gi'
  'python3-gi-cairo'
  'gir1.2-gtk-4.0'
  'gir1.2-adw-1'
)
makedepends=(
  'meson'
  'ninja'
  'vala'
  'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabutakut/gabutytb/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('05371f0ca0fe937742b89262559874e0c838ab806fa82a1873d9a54d04da6465')

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
