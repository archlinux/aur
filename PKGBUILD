# Maintainer: nhdfr  <nhdfr.dev@gmail.com>
pkgname=tabby-cli
pkgver=0.1.2
pkgrel=1
pkgdesc="A powerful terminal-based HTTP testing and stress testing tool with automated data generation capabilities."
arch=('x86_64')
url="https://github.com/nhdfr/tabby"
license=('AGPL-3.0')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nhdfr/tabby/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
  cd "$srcdir/tabby-$pkgver"
  rm -rf web
  go build -o tabby
}

package() {
  cd "$srcdir/tabby-$pkgver"
  install -Dm755 tabby "$pkgdir/usr/bin/tabby"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
