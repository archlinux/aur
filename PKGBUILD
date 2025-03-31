# Maintainer: Pixel

pkgname=walrs
pkgver=1.0.3
pkgrel=1
pkgdesc="A fast color scheme generator"
arch=('x86_64' 'aarch64')
url="https://github.com/Pixel2175/walrs"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'make')
source=("git+https://github.com/Pixel2175/walrs.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make build
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

