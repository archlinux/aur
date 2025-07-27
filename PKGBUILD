# Maintainer: Michael Schuh <michael.schuh.34@gmail.com>
pkgname=pons-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple CLI tool to look up translations via the Pons API"
arch=('x86_64')
url="https://github.com/mikachou/pons-cli"
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/mikachou/pons-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cea8403d161df28a6f08c0b8d8478a095f983d27e95eedf6b4b1e06ddbda9870')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o pons-cli .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 pons-cli "$pkgdir/usr/bin/pons-cli"
}
