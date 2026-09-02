# Maintainer: Danny Grove <aur@dannygrove.com>
pkgname=jcode
pkgver=0.81.4
pkgrel=1
pkgdesc="The most RAM efficient harness"
url="https://github.com/1jehuang/$pkgname"
license=("MIT")
options=("!lto")
arch=("x86_64" "aarch64")
conflicts=("jcode-bin")
provides=("jcode")
makedepends=("rust")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d765fdfaa58a98c01d97f2d6668d487d5906b05eb253952ad5f19bd369847b94')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --bin jcode
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
  install -D -m 0755 -t $pkgdir/usr/bin/ target/release/jcode
}
