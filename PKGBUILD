# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=diffr
pkgver=0.1.4
pkgrel=1
pkgdesc='Word-by-word diff highlighting tool'
arch=('i686' 'x86_64')
url="https://github.com/mookid/diffr"
license=('MIT')
conflicts=('diffr-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2613b57778df4466a20349ef10b9e022d0017b4aee9a47fb07e78779f444f8cb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
