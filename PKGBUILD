# Maintainer: MrDogeBro <MrDogeBro@users.noreply.github.com>

pkgname=quicknav
pkgver=1.0.0
pkgrel=1
pkgdesc="A way to quickly navigate your filesystem from the command line."
url="https://github.com/MrDogeBro/quicknav"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/MrDogeBro/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("7a2ddc6834a34c3b3bcee5b8e72912c6fcbfa077864e960ac44eef8dbdfa2cac")

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
