# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=eva
pkgver=0.2.3
pkgrel=1
pkgdesc='simple calculator REPL, similar to bc(1)'
arch=('x86_64')
url="https://github.com/NerdyPepper/eva"
license=('GPL3')
depends=()
conflicts=('eva-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('34ef8b7a7484689a602ab98e1f73d230f6020090b9d8e71a5f16a192c42ebbe9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
