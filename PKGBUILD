# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=eva
pkgver=0.2.1
pkgrel=1
pkgdesc='simple calculator REPL, similar to bc(1)'
arch=('x86_64')
url="https://github.com/NerdyPepper/eva"
license=('GPL3')
depends=()
conflicts=('eva-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab79c20de26f33b8a809e333cea4403afdd9848ce1e6c755e473953c4024c646')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
