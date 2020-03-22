# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=chars
pkgver=0.5.0
pkgrel=1
pkgdesc='Command line tool to display information about unicode characters.'
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/chars"
license=('MIT')
depends=()
conflicts=('chars-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5e2807b32bd75862d8b155fa774db26b649529b62da26a74e817bec5a26e1d7c')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
