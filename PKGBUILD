# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=diffr
pkgver=0.1.0
pkgrel=1
pkgdesc='Word-by-word diff highlighting tool'
arch=('i686' 'x86_64')
url="https://github.com/mookid/diffr"
license=('MIT')
conflicts=('diffr-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f36adc8cb9878d94a2ab505d0b189faf7c192e043adce53ce90e89b513b39a6d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
