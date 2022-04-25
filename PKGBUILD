# Maintainer: Michael Teuscher <michael.teuscher+aur@pm.me>
pkgname=libfprint-goodix-521d
_pkgdirname=libfprint
pkgver=1.94.1
pkgrel=8
pkgdesc="Library for fingerprint readers - For Goodix 521d and 538d"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=('libgusb>=0.3.0' nss pixman)
makedepends=(git gobject-introspection gtk-doc 'meson>=0.49.0' cmake pkg-config libgudev)
checkdepends=()
optdepends=()
provides=(libfprint libfprint-2.so libfprint-goodix-521d libfprint-2.so=2.64)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://github.com/infinytum/libfprint.git#branch=unstable")
sha256sums=('SKIP')

build() {
  arch-meson $_pkgdirname build
  ninja -C build
}


package() {
  DESTDIR="$pkgdir" meson install -C build
}
