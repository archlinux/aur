# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=ptail
pkgver=0.2.1
pkgrel=1
pkgdesc='Stream and display a fixed number of lines from processes output'
arch=('x86_64')
url="https://github.com/orf/ptail"
license=('custom')
depends=()
conflicts=('ptail-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2b482ec33e899caed985a046fdf6f19cd39af9d3b26ca3012333bd9b2cc69c44')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
