# Maintainer: David Birks <david@tellus.space>

pkgname=cloudflare-wrangler
pkgver=1.7.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('62ce93f82f7043d66e0e11cd45512a8482dbe4fcaad1b1023ad64102978faee0004bfd2d54f59d3d0c41e11b10bd522eeb463a9ba23e6a99ea789fbdf27d6a4d')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
