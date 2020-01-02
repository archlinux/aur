# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=eva
pkgver=0.2.7
pkgrel=1
pkgdesc='simple calculator REPL, similar to bc(1)'
arch=('x86_64')
url="https://github.com/NerdyPepper/eva"
license=('GPL3')
depends=()
conflicts=('eva-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('72b2e47e987102d67c9dcbb60e26c4ff0b20e6f844d0d2b9d91c3f073374aee0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
