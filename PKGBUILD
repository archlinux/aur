# Maintainer: Thomas Recloux <thomas at recloux dot fr>

pkgname=rustic
pkgver=0.2.1
pkgrel=1
pkgdesc='Rustic is a wrapper around the Restic backup program'
url='https://github.com/bnavetta/rustic'
license=(MIT)
arch=(x86_64)
depends=(restic)
makedepends=(cargo rust git)
conflicts=(rustic)
provides=(rustic)
source=("git+https://github.com/bnavetta/$pkgname#tag=v$pkgver")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
