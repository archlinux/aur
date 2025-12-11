pkgname=ghpkg
pkgver=1.0.0
pkgrel=1
pkgdesc="Indev package manager"
arch=('any')
url="https://github.com/Frothy7650/ghpkg/"
license=('MIT')
source=("https://github.com/Frothy7650/ghpkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec444010f4ae57bd504262d394c32e1d13f6587e32ff2846d07b1cadaeb17c5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make linux
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ghpkg "$pkgdir/usr/bin/ghpkg"
  install -Dm644 db.json "$pkgdir/etc/ghpkg/db.json"
}
