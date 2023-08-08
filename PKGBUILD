# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=chars
pkgver=0.7.0
pkgrel=1
pkgdesc='Command line tool to display information about unicode characters.'
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/chars"
license=('MIT')
depends=()
conflicts=('chars-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2f79843a3b1173870b41ebce491a54812b13a44090d0ae30a6f572caa91f0736')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
