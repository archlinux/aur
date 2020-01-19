# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=asd
pkgver=0.1.0
pkgrel=2
pkgdesc='Preview Github Markdown Offline'
arch=('i686' 'x86_64')
url="https://github.com/grapegrip/asd"
license=('MIT')
depends=()
conflicts=('asd-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9257a56c4c22460d2927dcdeb4e4ac16787552c3a213c1e1baf23fd4e270b9e2')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  # License is coming in next release
  # install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
