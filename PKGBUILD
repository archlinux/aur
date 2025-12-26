pkgname=waifu
pkgver=0.1.4
pkgrel=1
pkgdesc="Tool to fetch and display images from waifu.pics"
arch=('x86_64')
url="https://github.com/izeperson/waifu-cli"
license=('MIT')
depends=('kitty')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/izeperson/waifu-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('322a3879ab0dbd76016e6ed1cbd0fd7e45f593a01ef20234ee258ed880b8fce3')

build() {
  cd "$srcdir/waifu-cli-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/waifu-cli-$pkgver"
  install -Dm755 target/release/waifu "$pkgdir/usr/bin/waifu"
}
