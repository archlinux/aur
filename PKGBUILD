# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=libodd-git
pkgver=r2.074b1ec
pkgrel=1
pkgdesc="a troll"
arch=('any')
url="https://github.com/TheOddCell/libodd"
license=('BSD0')
depends=()
makedepends=('git' 'make' 'gcc' 'binutils' 'coreutils')
provides=('libodd')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
conflicts=()
options=('staticlibs')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" make install
}
