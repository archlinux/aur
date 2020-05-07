# Maintainer: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.9.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('1825c051f60f9cbbedcee74bb0fc9dd65ee067b7f45a6489004502e7c0cbfcb9fb9886b8ef89d6e45ccec9b371d7a30e73ea774554b692ad7d66a84dd71ea7d9')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
