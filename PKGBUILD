pkgname=waifu
pkgver=0.1.7
pkgrel=1
pkgdesc="Tool to fetch and display anime images from nekos.best"
arch=('x86_64')
url="https://github.com/izeperson/waifu-cli"
license=('MIT')
depends=('kitty')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/izeperson/waifu-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7886f42fce579c93274cbdcd193de1f0f9e2288db9cd8ee54fdc95372a0d54ac')

build() {
  cd "$srcdir/waifu-cli-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/waifu-cli-$pkgver"
  install -Dm755 target/release/waifu "$pkgdir/usr/bin/waifu"
}
