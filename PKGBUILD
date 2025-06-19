# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub
pkgver=0.4.48
pkgrel=1
pkgdesc="An experimental mdbook backend for creating EPUB documents."
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MPL-2.0)
depends=(gcc-libs glibc)
makedepends=(rust cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3c135eaf37f9c2bfb694a34ffefe2aaf80aa6b09968bcaee7ef428221025fa7a')

build() {
  cd mdbook-epub-$pkgver
  cargo build --release
}

package() {
  cd mdbook-epub-$pkgver
  install -Dm 755 target/release/mdbook-epub "$pkgdir"/usr/bin/mdbook-epub
}
