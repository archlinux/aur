# Maintainer: Torben <git@letorbi.com>

pkgname=swissfer
pkgver=3.0.0
pkgrel=1
arch=(x86_64)
pkgdesc="Command line interface for Swisstransfer."
url='https://github.com/Blutsh/swissfer'
license=(GPL)
makedepends=(cargo)
source=("https://github.com/Blutsh/swissfer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('81229eef0045350d14b08c31701d2b77792db5a7e7c42af3ee29c09f4f166f59')

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
