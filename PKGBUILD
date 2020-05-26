# Maintainer: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.9.2
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('7cd40b2b5972676aa6da855a809d76d6924e6e00ffd6caccb1404ce92198665db9c6654dec6934eeeefaffb2001664a05509db91dc32b09bb61fb86e9268499d')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
