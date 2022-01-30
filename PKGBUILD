# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.2.5
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e3121293afce03526b6f83e7e2702a166a12803baac18282f499492ea32f4e184624137bbf21ef1ae990184a9fceb976e5555223ff3624fab0f1d59fb6bc76d2')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
