# Maintainer: Torben <git@letorbi.com>

pkgname=swissfer
pkgver=3.0.1
pkgrel=1
arch=(x86_64)
pkgdesc="Command line interface for Swisstransfer."
url='https://github.com/Blutsh/swissfer'
license=(GPL)
makedepends=(cargo)
source=("https://github.com/Blutsh/swissfer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('33c11ce79ec7807f852e966b0b12277933e54fb8f58c6722fc3c32a6bd5b9e2f')

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
