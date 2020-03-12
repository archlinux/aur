# Maintainer: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.8.2
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('da01fdf178b7d0b18686c1e72358ea83ded5aabcd08682e01de0a201e754a1bb614d0008ce15bebee58f4ab210ec9c062e1d2d40d30e89574ad2772bcf77fa58')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
