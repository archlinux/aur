# Maintainer: Ardeaf <ardeaf@gmail.com>

pkgname=redelete
pkgver=0.2.2
pkgrel=1
pkgdesc='Delete all of your reddit comments and submissions, with optional filters to skip certain posts.'
arch=('x86_64')
url=https://github.com/ardeaf/redelete
license=('AGPL-3.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("redelete-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/redelete "$pkgdir"/usr/bin/redelete
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/redelete/LICENSE
}
md5sums=('a7359083a303e95c40e1c963a2e6c7e6')
md5sums=('a7359083a303e95c40e1c963a2e6c7e6')
md5sums=('9d44f3c04ae215c53775edf0e2284e9f')
