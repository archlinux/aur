# Maintainer:  zhullyb < zhullyb [at] outlook dot com >
# Maintainer: xmengnet <794508986@qq.com>
# Contributor: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.19.4
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
md5sums=('ae16ddb3f11db568ed2e3910fc7adc6e')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
