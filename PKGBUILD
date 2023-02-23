# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=infinite-storage-glitch
pkgver=1.0.0
pkgrel=1
pkgdesc="Lets you embed files into video and upload them to youtube as storage."
url="https://github.com/DvorakDwarf/Infinite-Storage-Glitch"
license=("GPL3")
depends=(opencv)
makedepends=(rust clang)
arch=('any')
source=(https://github.com/DvorakDwarf/Infinite-Storage-Glitch/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2e5baa266a1e4cfde9bd97f9cbea09c762fd1d38bd0726e72e0364965ec1894a')

build() {
   cd "Infinite-Storage-Glitch-$pkgver"
   cargo build --release
}

package() {
  cd "Infinite-Storage-Glitch-$pkgver"
  install -Dm755 "target/release/isg_4real" -t "$pkgdir/usr/bin/"
}
