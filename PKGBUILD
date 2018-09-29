# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=n-dhcp4
pkgver=0
pkgrel=1
pkgdesc="Dynamic Host Configuration Protocol for IPv4"
url="https://github.com/nettools/n-dhcp4"
license=('LGPL2.1' 'Apache')
arch=(x86_64)
depends=(glibc)
makedepends=(meson pkgconf)
_commit=b8068385c2ab3539494f01971f64c0d5db8d5dbf  #20180929
source=("git+https://github.com/nettools/n-dhcp4.git#commit=$_commit")
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

