# Maintainer: Torben <git@letorbi.com>

pkgname=swish
pkgver=1.0.2
pkgrel=1
arch=(x86_64)
pkgdesc="Command line interface for Infomaniak's Swisstransfer service."
url='https://github.com/Blutsh/Swish'
license=(GPL)
makedepends=(cargo)
source=("https://github.com/Blutsh/Swish/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('25893418e02e6d35ef7712fea447c450f148e15bccfecac39bb8f18fd4ef732d')

prepare() {
  pwd
  ln -sf "Swish-$pkgver" "swish"
}

build() {
  cd "$pkgbase"

  cargo build --release
}

package() {
  #cargo install --path "$pkgbase" --root "$pkgdir"

  mkdir -p "$pkgdir/usr/bin"
  cp "$pkgbase/target/release/swish" "$pkgdir/usr/bin/"
}
