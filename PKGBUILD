# Maintainer: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.11.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('800b906bdade36c43f68ebcb217619b65ceff059bd970147c9147c625371be8c2c1dc5750229a6cf19a46d30737ea2e25fb12b8aa94195ade0abd69f6a9bbba5')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
