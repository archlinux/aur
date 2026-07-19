pkgname=intqual
pkgver=1.3.0
pkgrel=1
pkgdesc="A network diagnostic tool"
arch=('x86_64')
url="https://github.com/RaijuMounun/intqual"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RaijuMounun/intqual/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('461bb2296985dae8237002af47eb376c567da56942c2dc209d70603fe1335e52')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
