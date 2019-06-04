# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=topgrade
pkgver=2.1.0
pkgrel=1
pkgdesc='Invoke the upgrade proceadure of multiple package managers'
arch=('x86_64' 'armv7')
url='https://github.com/r-darwish/topgrade'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('910f13bb46347bac373c4fd38e2b13a47d396782d48d7f631fc5444beacbc3a4')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
