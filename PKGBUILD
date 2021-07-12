# Maintainer: MrDogeBro <MrDogeBro@users.noreply.github.com>

pkgname=quicknav
pkgver=1.2.1
pkgrel=1
pkgdesc="A way to quickly navigate your filesystem from the command line."
url="https://github.com/MrDogeBro/quicknav"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/MrDogeBro/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("7ba12092a5df568a2a53e1127a9f26fbcbb19dcaf3f24ed0d799686671bd8968")

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
