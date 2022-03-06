# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub
pkgver=0.4.14
pkgrel=1
pkgdesc="MDBook EPUB Backend"
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('d2cf2c38c50a3eb476c14854f395ce3423ec58ddc310699d747df5a6f37f6cf1')

build() {
  cd mdbook-epub-$pkgver
  cargo build --release
}

package() {
  cd mdbook-epub-$pkgver
  install -Dm 755 target/release/mdbook-epub "$pkgdir"/usr/bin/mdbook-epub
}
