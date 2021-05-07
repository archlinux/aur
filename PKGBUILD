# Maintainer: MrDogeBro <MrDogeBro@users.noreply.github.com>

pkgname=quicknav
pkgver=0.2.0
pkgrel=1
pkgdesc="A way to quickly navigate your filesystem from the command line."
url="https://github.com/MrDogeBro/quicknav"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/MrDogeBro/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("7f0dcc61721b416dded9961bd1e202b3ca25909d3468aa5b631e3b2d5771db21")

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
