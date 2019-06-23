# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=eva
pkgver=0.2.5
pkgrel=1
pkgdesc='simple calculator REPL, similar to bc(1)'
arch=('x86_64')
url="https://github.com/NerdyPepper/eva"
license=('GPL3')
depends=()
conflicts=('eva-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0560cf35cfe79ec4dbc57c1d8d9818c94871d92af896a7644fda3ebedd4d6065')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
