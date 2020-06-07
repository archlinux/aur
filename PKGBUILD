# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=topgrade
pkgver=4.6.0
pkgrel=1
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/r-darwish/topgrade'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fc1f1efdd1d108cd2c2a39e544c0e11a20cf7460bd8abf22104807b28d33ae11')

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
