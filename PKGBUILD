# Maintainer: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.8.4
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('92703213dad78ca90797bad0d2508bd7a5d82629987967130189ce805de203eef46fa24015a1258f6cdecd9869b32c6b64f1a7f9de49d19f75fca41d99d015ed')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
