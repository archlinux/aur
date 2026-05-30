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
sha256sums=('cea880ec2640d3244f23157f40991d7502f74c553c44c7522ca374cdd2df983b')

build() {
  cd "$srcdir/waifu-cli-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/waifu-cli-$pkgver"
  install -Dm755 target/release/waifu "$pkgdir/usr/bin/waifu"
}
