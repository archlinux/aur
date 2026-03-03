pkgname=rimilo
pkgver=0.2.5
pkgrel=1
pkgdesc='Rapida rimvort-serchilo por Esperanto-angla vortaro'
arch=('x86_64')
url='https://github.com/Fierthraix/rimilo'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('16f913ae54194521cb90ee712710cc1f2a4fdc465c9fffa4592074f0f86e2bcb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
