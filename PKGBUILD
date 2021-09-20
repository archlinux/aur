# Maintainer: MrDogeBro <MrDogeBro@users.noreply.github.com>

pkgname=quicknav
pkgver=1.3.0
pkgrel=1
pkgdesc="A way to quickly navigate your filesystem from the command line."
url="https://github.com/MrDogeBro/quicknav"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/MrDogeBro/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("b5d077acf107d93f93c8ff45e80f57fdf5e1667b4e681dae31672627fb01793d")

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
