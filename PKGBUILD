# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=ruut
pkgver=0.6.0
pkgrel=1
pkgdesc='Print arbitrary trees on the command line.'
arch=('i686' 'x86_64')
url="https://github.com/HarrisonB/ruut"
license=('MIT')
depends=()
conflicts=('ruut-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bb1206682b9e33c50fda0462b2361807ae349a7c8cbc2d52c7f432a197d2d0ef')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
