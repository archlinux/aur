# Maintainer: Punpakorn Pothinalan <p.pothinalan@gmail.com>
pkgname=aurorus
pkgver=1.0
pkgrel=1
pkgdesc="A very basic and barebone AUR Helper. Written in Rust"
arch=('x86_64')
url="https://github.com/pl-PkMn/aurorus"
license=('MIT')
depends=('rust' 'cargo')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pl-PkMn/aurorus/archive/refs/tags/1.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
