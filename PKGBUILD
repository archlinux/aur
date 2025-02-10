# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub
pkgver=0.4.44
pkgrel=1
pkgdesc="MDBook EPUB Backend"
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MPL-2.0)
depends=(gcc-libs glibc)
makedepends=(rust cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('643326695c025c7ca1279ff512c27c5f3eb81880ba87b1a661e18a4d289b905c')

build() {
  cd mdbook-epub-$pkgver
  cargo build --release
}

package() {
  cd mdbook-epub-$pkgver
  install -Dm 755 target/release/mdbook-epub "$pkgdir"/usr/bin/mdbook-epub
}
