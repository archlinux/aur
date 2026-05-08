# Maintainer: 6543 <6543@obermui.de>

pkgname=batmon
pkgdesc="Interactive batteries viewer"
pkgver=0.2.0
pkgrel=0
arch=('x86_64')
url="https://github.com/6543/batmon"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/6543/batmon/archive/v${pkgver}.tar.gz")
sha512sums=(
  'a154c7b1da7ec48b6a93d16cc12ef45ac80dc8e78bfb974933ab05246c5f5d9272114f5cede397877ffee985632b832948c27b044f7a8c8d7582190ae9ebc4bf'
)

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package_batmon() {
  cd "$pkgname-$pkgver"

  install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
