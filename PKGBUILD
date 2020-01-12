# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=lsvine
pkgver=0.2.5
pkgrel=1
pkgdesc="List contents of directories in a vine-like format"
url=https://github.com/autofitcloud/lsvine
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('233be0e9dee138dc42561748a1c3d42640ec27b7d8cb937d7467ef6a268cdbd323e38321c37c5f9a31bd104ae8e665c49801585d719e72a37f3fbb62dfe3e075')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/lsvine" "$pkgdir/usr/bin/lsvine"
}
