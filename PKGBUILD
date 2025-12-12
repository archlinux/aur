pkgname=ghpkg
pkgver=1.2.0
pkgrel=1
pkgdesc="Indev package manager"
arch=('any')
url="https://github.com/Frothy7650/ghpkg/"
license=('MIT')
source=("https://github.com/Frothy7650/ghpkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41b47909c5e3790c7003d8b1db74bf908a463f4fcbca9dabae9ec7c4aebc9bc0')
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
