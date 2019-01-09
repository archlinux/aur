# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=onefetch
pkgver=1.0.5
pkgrel=1
makedepends=('cargo')
url="https://github.com/o2sh/onefetch"
pkgdesc="Displays information about your project directly on your terminal"
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
sha256sums=('8dfc305981beaf7ada8d4571813cbecde210aef07e7702bd604e21b88ce5c20f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
