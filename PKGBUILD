# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=topgrade
pkgver=3.7.1
pkgrel=1
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'armv7')
url='https://github.com/r-darwish/topgrade'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2f75d3315ac925d0735836ddee251446f78366060e801202cecd8ad76fe1ea08')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
