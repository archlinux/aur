pkgname=ghpkg
pkgver=2.0.1
pkgrel=1
pkgdesc="Indev package manager"
arch=('any')
url="https://github.com/Frothy7650/ghpkg/"
license=('MIT')
source=("https://github.com/Frothy7650/ghpkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0dcac30e846975be914a22d770b20a38b6ce30f15327af0d6ef3db7c94119be8')
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
