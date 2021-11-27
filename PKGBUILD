# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.2.4
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bd50fd5db9a3ab5be40ea869421681d252b0827f6b744898b069e05705603969d6d2b9887ac87b910c4a690683c895ec0dc6ad24e0f88414d014b90857a1859d')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
