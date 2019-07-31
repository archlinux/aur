# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=n-dhcp4
pkgver=1
pkgrel=1
pkgdesc="Dynamic Host Configuration Protocol for IPv4"
url="https://github.com/nettools/n-dhcp4"
license=('LGPL2.1' 'Apache')
arch=(x86_64)
depends=(glibc)
makedepends=(meson pkgconf)
source=("git+https://github.com/nettools/n-dhcp4.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  rm -rf build
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

