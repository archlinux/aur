# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xisxwayland
pkgver=1
pkgrel=1
pkgdesc="Tool to determine whether the X server in use is Xwayland"
url="https://gitlab.freedesktop.org/xorg/app/xisxwayland"
arch=(x86_64)
license=(MIT)
makedepends=(meson ninja)
depends=(libx11 libxrandr)
source=("https://xorg.freedesktop.org/archive/individual/app/xisxwayland-$pkgver.tar.xz")
sha256sums=('39eff8ab32e7fa3d94fad61eaba9c970f51221f2b76897a66f16ff0b34f02a29')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

false &&
check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
