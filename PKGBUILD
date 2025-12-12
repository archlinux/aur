pkgname=ghpkg
pkgver=1.1.4
pkgrel=1
pkgdesc="Indev package manager"
arch=('any')
url="https://github.com/Frothy7650/ghpkg/"
license=('MIT')
source=("https://github.com/Frothy7650/ghpkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('62d406f74a2f651a135536499989f3da38ca77f3683fb5e9ba010dd53638dc07')
depends=('git')
makedepends=('vlang')
options=('!debug')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make aur
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ghpkg "$pkgdir/usr/bin/ghpkg"
  install -Dm644 db.json "$pkgdir/etc/ghpkg/db.json"
}
