# Maintainer: Punpakorn Pothinalan <p.pothinalan@gmail.com>
pkgname=aurorus
pkgver=1.3
pkgrel=1
pkgdesc="A very basic and terrible AUR Helper. Written in Rust"
arch=('x86_64')
url="https://github.com/pl-PkMn/aurorus"
license=('MIT')
depends=('rust' 'cargo')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pl-PkMn/aurorus/archive/refs/tags/v1.3.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
