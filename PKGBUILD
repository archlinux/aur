# Maintainer: David Birks <david@tellus.space>

pkgname=cloudflare-wrangler
pkgver=1.6.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('6aa2ab631b9af9a0d26fa31840e6c6ad9d342d8c99234a5d84ef4baa1da392fd3f760710d9104f2ea6011b4a67be565e124d4376997201e347330aea42235fbe')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
