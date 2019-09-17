# Maintainer: David Birks <david@tellus.space>

pkgname=cloudflare-wrangler
pkgver=1.3.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
sha512sums=('8538b73710ab79cebd24e9bb7f7e3285161a75236b18ee1fc6747cb141e707fc1656380d88121f0776c3fb08da6093ae725ec7ff0598f36a84d38b12e7bc89b5')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
