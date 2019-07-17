# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=diffr
pkgver=0.1.1
pkgrel=1
pkgdesc='Word-by-word diff highlighting tool'
arch=('i686' 'x86_64')
url="https://github.com/mookid/diffr"
license=('MIT')
conflicts=('diffr-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('28e6f17895cef68854b859bc4e7aebffeca36a678cb3ab5a611872356d845b0b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
