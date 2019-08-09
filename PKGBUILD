# Maintainer: David Birks <david@tellus.space>

pkgname=cloudflare-wrangler
pkgver=1.1.1
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('17c553bc504dbb3cc99c6a19e5c2ac1e957793e584864f51bc576cbc47a29d4b5bd149c23761f5dfbe5d5670724310e8721580e373979a1a668397b0e9a99521')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
