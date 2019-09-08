# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=diffr
pkgver=0.1.2
pkgrel=1
pkgdesc='Word-by-word diff highlighting tool'
arch=('i686' 'x86_64')
url="https://github.com/mookid/diffr"
license=('MIT')
conflicts=('diffr-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('76767fec7bcec1f86ed0c21c05ce4fee3ac41e00f2b88e91249102b02c0f7307')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
