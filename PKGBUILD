# Maintainer:  zhullyb < zhullyb [at] outlook dot com >
# Maintainer: xmengnet <794508986@qq.com>
# Contributor: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.21.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler-legacy/archive/v$pkgver.tar.gz")
md5sums=('cea03e992c4265a8e22c1bc4bc7e21b5')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
