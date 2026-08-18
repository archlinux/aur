# Maintainer: Torben <git@letorbi.com>

pkgname=swissfer
pkgver=2.0.0
pkgrel=1
arch=(x86_64)
pkgdesc="Command line interface for Swisstransfer."
url='https://github.com/Blutsh/swissfer'
license=(GPL)
makedepends=(cargo)
source=("https://github.com/Blutsh/swissfer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('426c118fd97aa9d829e50a1728b724f19ca5c1f91f6e7872f40cd10677c619d3')

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
