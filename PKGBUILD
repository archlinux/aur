pkgname=waifu
pkgver=0.1.2.2
pkgrel=2
pkgdesc="Tool to fetch and display images from waifu.pics"
arch=('x86_64')
url="https://github.com/izeperson/waifu-cli"
license=('MIT')
depends=('kitty')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/izeperson/waifu-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c278d1f1552ddf19a405982b2611c985c5fa8e3309944141e652a41d398d31b')

build() {
  cd "$srcdir/waifu-cli-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/waifu-cli-$pkgver"
  install -Dm755 target/release/waifu "$pkgdir/usr/bin/waifu"
}
