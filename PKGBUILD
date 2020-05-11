# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub
pkgver=0.3.0
pkgrel=1
pkgdesc="MDBook EPUB Backend"
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1dfa8a58e969d975d365d32dec4ebbfbb066e55c58c3f329d59f96c8bae121f4')

build() {
  cd mdbook-epub-$pkgver
  cargo build --release
}

package() {
  cd mdbook-epub-$pkgver
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
