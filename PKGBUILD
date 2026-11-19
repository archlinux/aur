# Maintainer: Torben <git@letorbi.com>

pkgname=swissfer
pkgver=3.0.3
pkgrel=1
arch=(x86_64)
pkgdesc="Command line interface for Swisstransfer."
url='https://github.com/Blutsh/swissfer'
license=(GPL)
makedepends=(cargo)
source=("https://github.com/Blutsh/swissfer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('90c1a97debdb2bc2285e20000c8f06181834e60c869b1b338ad0b9192ec01b3c')

prepare() {
  ln -sf "$pkgname-$pkgver" "$pkgname"
}

build() {
  cd "$pkgbase"

  cargo build --release
}

package() {
  cargo install --path "$pkgbase"

  mkdir -p "$pkgdir/usr/bin"
  cp "$pkgbase/target/release/swissfer" "$pkgdir/usr/bin/"
}
