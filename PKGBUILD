# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=n-ndp
pkgver=0
pkgrel=1
pkgdesc="IPv6 Neighbor Discovery Protocol"
url="https://github.com/nettools/n-ndp"
license=('Apache')
arch=(x86_64)
depends=(glibc)
makedepends=(meson pkgconf)
_commit=bdf742f6594a8abbcfc96c4e5022262365141fc2 #20180929
source=("git+https://github.com/nettools/n-ndp.git#commit=$_commit")
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

