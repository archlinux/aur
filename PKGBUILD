# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.1.5
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('519b2b0cdfa839f599e4719ef008dc546978797e633b7a9b4434a43b371e58299a390b5323abc21880f8580c59cc1e8a9402abb8d191092d34e33d54766035c9')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
