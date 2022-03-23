# Maintainer:  zhullyb < zhullyb [at] outlook dot com >
# Maintainer: xmengnet <794508986@qq.com>
# Contributor: David Birks <david@birks.dev>

pkgname=cloudflare-wrangler
pkgver=1.19.11
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://github.com/cloudflare/wrangler"
license=('Apache' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/wrangler/archive/v$pkgver.tar.gz")
md5sums=('8635dd44db9d6c0cf15004fe7010f83c')

build() {
  cd wrangler-$pkgver
  cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/wrangler-$pkgver/target/release/wrangler" "$pkgdir/usr/bin/wrangler"
}
