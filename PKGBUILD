# Maintainer: Thomas Schoenauer <t.schoenauer@hgs-wt.at>
# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=topgrade
pkgver=11.0.1
pkgrel=1
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('72a402c7fd85ab3040e924947a2fdcc5937a6abf1515f0b6b7ff5a038f5891ab')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
