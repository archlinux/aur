# Maintainer: Torben <git@letorbi.com>

pkgname=swissfer
pkgver=3.0.2
pkgrel=1
arch=(x86_64)
pkgdesc="Command line interface for Swisstransfer."
url='https://github.com/Blutsh/swissfer'
license=(GPL)
makedepends=(cargo)
source=("https://github.com/Blutsh/swissfer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('02de9293ef1096c151d58e4226e50f2d163722e9634da085a90c346a69ef4c5d')

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
