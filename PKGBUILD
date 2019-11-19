# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=topgrade
pkgver=3.4.0
pkgrel=1
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'armv7')
url='https://github.com/r-darwish/topgrade'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8dc0357f031e5ffb941f57750293540ec41ac1f0453774d3d2a031ef0e47a8e3')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
