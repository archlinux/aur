# Maintainer: Ardeaf <ardeaf@gmail.com>

pkgname=redelete
pkgver=0.3.1
pkgrel=1
pkgdesc='Delete all of your reddit comments and submissions, with optional filters to skip certain posts.'
arch=('x86_64')
url=https://github.com/ardeaf/redelete
license=('MIT')
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
md5sums=('83ee23b93e4a0170dc4eb2f95027e7b9')
