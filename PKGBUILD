# Maintainer: Ivan Tham <pickfire@riseup.net>

pkgname=babelfish
pkgver=0.1.2
pkgrel=0
pkgdesc='Universal translater for encodings'
arch=('x86_64')
url=https://github.com/pickfire/babelfish
license=('Apache' 'MIT')
depends=()
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('165f5acf5108dc8e4bf6e58e4d563a7112613340fa8316af482582383e1ffe15')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgname/usr/bin/$pkgname"
}
