# Maintainer: Danny Grove <aur@dannygrove.com>
pkgname=jcode
pkgver=0.81.6
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
sha256sums=("d0990e9d85afb467a24e1b293d805f4d22cef80785d7a7dad73d6bf8b3d843d7")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --bin jcode
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
  install -D -m 0755 -t $pkgdir/usr/bin/ target/release/jcode
}
