# Maintainer: David Birks <david@tellus.space>

pkgname=cloudflare-wrangler
pkgver=1.4.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('f6801c0b232efa46e785071746f9cc34a7b7d57b8b9cd23aa6692ad3049be590244644a40ff4d2230f70f532e556fa093144874663058c688de050b3046918e6')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
