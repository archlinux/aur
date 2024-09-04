# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub
pkgver=0.4.37
pkgrel=3
pkgdesc="MDBook EPUB Backend"
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MPL-2.0)
depends=(gcc-libs glibc)
makedepends=(rust cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('028702150826d7f2ed13d0892f5cbf44d7dbf4854a1b16df35a4da5658e59446')

build() {
  cd mdbook-epub-$pkgver
  cargo build --release
}

package() {
  cd mdbook-epub-$pkgver
  install -Dm 755 target/release/mdbook-epub "$pkgdir"/usr/bin/mdbook-epub
}
