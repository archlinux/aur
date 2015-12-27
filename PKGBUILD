# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rustfmt
pkgver=0.2.1
pkgrel=1
pkgdesc="A tool for formatting Rust code according to style guidelines"
url="https://github.com/rust-lang-nursery/rustfmt"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
_pkghash='e72c24502323dfeb0dc089dc795b3e28f0eb2536'
source=("https://github.com/rust-lang-nursery/$pkgname/archive/$_pkghash/$pkgname-$pkgver.tar.gz")
sha256sums=('07de208ed2091b1e3b79090bbb8e1c85cca1b6bf77e2bf6d507efea604b80cf2')

build() {
  cd "$pkgname-$_pkghash"
  cargo build --release
}

package() {
  cd "$pkgname-$_pkghash"
  install -Dm755 target/release/rustfmt "$pkgdir/usr/bin/rustfmt"
  install -Dm755 target/release/cargo-fmt "$pkgdir/usr/bin/cargo-fmt"
}
