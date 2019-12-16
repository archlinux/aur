# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=diffr
pkgver=0.1.3
pkgrel=1
pkgdesc='Word-by-word diff highlighting tool'
arch=('i686' 'x86_64')
url="https://github.com/mookid/diffr"
license=('MIT')
conflicts=('diffr-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7fd8c078a1b94140624a5a021eef059a916f79cdf21cfba7489f83be8fadfaa2')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
