# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=linky
pkgver=0.2.0
pkgrel=1
pkgdesc='Extract and check links from Markdown files'
arch=('i686' 'x86_64')
url="https://github.com/mattias-p/linky"
license=('Apache')
depends=()
conflicts=('linky-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5d19dc730f5e3e5046f43030f847fe24e4fe196bf4322aee50d39be148ad8c0c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
