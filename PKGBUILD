# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xisxwayland
pkgver=2
pkgrel=1
pkgdesc="Tool to determine whether the X server in use is Xwayland"
url="https://gitlab.freedesktop.org/xorg/app/xisxwayland"
arch=(x86_64)
license=(MIT)
makedepends=(meson ninja)
depends=(libx11 libxrandr)
source=("https://xorg.freedesktop.org/archive/individual/app/xisxwayland-$pkgver.tar.xz")
sha256sums=('d24d9cdff3e3a7ee9456384eab8caaa1d71530d9d95131a23a243ebbee5da22d')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
