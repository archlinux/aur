pkgname=waifu
pkgver=0.1.6
pkgrel=1
pkgdesc="Tool to fetch and display anime images from nekos.best"
arch=('x86_64')
url="https://github.com/izeperson/waifu-cli"
license=('MIT')
depends=('kitty')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/izeperson/waifu-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24ba855baad5d3d9539f63991d6b6f5d9de5cfdd51ab50723644c39ab391f66b')

build() {
  cd "$srcdir/waifu-cli-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/waifu-cli-$pkgver"
  install -Dm755 target/release/waifu "$pkgdir/usr/bin/waifu"
}
