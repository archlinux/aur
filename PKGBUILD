# Maintainer: Thomas Schoenauer <t.schoenauer@hgs-wt.at>
# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=topgrade
pkgver=10.1.0
pkgrel=1
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7fb22358c85e0675650dc0c947e07afc390d446a4f78f085468b7487923b9665')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.8 "$pkgdir/usr/share/man/man8/$pkgname.8"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
