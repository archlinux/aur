pkgname=ghpkg
pkgver=2.0.2
pkgrel=1
pkgdesc="Indev package manager"
arch=('any')
url="https://github.com/Frothy7650/ghpkg/"
license=('MIT')
source=("https://github.com/Frothy7650/ghpkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a504fd6b0a53c624b825a2c78b582ed73d8cc3172ae776786d470397dfe38333')
depends=('git')
makedepends=('vlang')
options=('!debug')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make aur
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src/ghpkg "$pkgdir/usr/bin/ghpkg"
  install -Dm644 db.json "$pkgdir/etc/ghpkg/db.json"
}
