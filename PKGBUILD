# Maintainer: Srinath10X <srinathcreates@gmail.com>
# Github: https://github.com/Srinath10X/ttype

pkgname=ttype
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based typing test application"
arch=('x86_64' 'aarch64')
url="https://github.com/Srinath10X/ttype"
license=('GPL3')
makedepends=('git' 'make' 'base-devel')  
source=("git+https://github.com/Srinath10X/ttype.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "build/$(uname -m)/ttype-$(uname -m)" "$pkgdir/usr/bin/ttype"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
