# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=ruut
pkgver=0.7.0
pkgrel=1
pkgdesc='Print arbitrary trees on the command line.'
arch=('i686' 'x86_64')
url="https://github.com/HarrisonB/ruut"
license=('MIT')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('595b91cf2f66ff3263379b271ab09ae8d0d9f72d22f4044dc492a10de8918f5e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
