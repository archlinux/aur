# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=linky
pkgver=0.1.8
pkgrel=1
pkgdesc='Extract and check links from Markdown files'
arch=('i686' 'x86_64')
url="https://github.com/mattias-p/linky"
license=('Apache')
depends=()
conflicts=('linky-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e8cc01d93abf3a8a5365660ef4e246494a1cc44f6ec3955a2c4f60c7810bfdeb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
