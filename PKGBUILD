# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=ao-theoddcell-git
pkgver=r12.779d1e2
pkgrel=1
pkgdesc="Arg 0"
arch=('any')
url="https://github.com/TheOddCell/ao"
license=('MIT')
depends=()
makedepends=('git' 'make' 'gcc')
provides=('ao')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
conflicts=("ao-git")

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
  install -Dm755 ao "$pkgdir/usr/bin/ao"
  install -Dm755 argv "$pkgdir/usr/bin/argv"
}
