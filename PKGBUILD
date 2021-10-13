# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=detox-rs
_pkgname=detox
pkgver=0.1.2
pkgrel=1
pkgdesc="Quickly clean up your development directories"
arch=('x86_64')
url="https://github.com/whitfin/detox"
license=('MIT')
makedepends=('cargo')
conflicts=('detox')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('808c3ed1fc47fafd732735237de555ec041327c92f7d42f95827f14d4f3c42b7')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
