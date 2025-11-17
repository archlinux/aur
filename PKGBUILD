pkgname=waifu
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool to fetch and display images from waifu.pics"
arch=('x86_64')
url="https://github.com/izeperson/waifu-cli"
license=('MIT')
depends=('kitty')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/izeperson/waifu-cli/archive/refs/tags/stable.tar.gz")
sha256sums=('ea0e159b3dcec9d9a9b40abee29435287c54c859bc02d6cd761079bdd787fd25')

build() {
  cd "$srcdir/waifu-cli-stable"
  cargo build --release
}

package() {
  cd "$srcdir/waifu-cli-stable"
  install -Dm755 target/release/waifu "$pkgdir/usr/bin/waifu"
}
