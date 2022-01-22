# Maintainer: Alice S. <quarkyalice@disroot.org>
pkgname=emu2-git
pkgver=r91.c01cfa8
pkgrel=1
pkgdesc="A simple DOS emulator for the Linux text console, supporting basic DOS system calls and console I/O."
arch=('any')
url="https://github.com/dmsc/emu2"
license=('GPL')
makedepends=(git)
source=("${pkgname}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}

