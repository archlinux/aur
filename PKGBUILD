# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=topgrade
pkgver=0.14.0
pkgrel=1
pkgdesc='Invoke the upgrade proceadure of multiple package managers'
arch=('x86_64' 'armv7')
url='https://github.com/r-darwish/topgrade'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('68c965f047226d71a0f7db5eadf45ea46d538c895bf83d76629d148ddf8ec66c')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
