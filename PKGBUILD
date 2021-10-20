# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.2.2
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b273f3d348a7cca378b91d3bad7c2f7117b4b8159341adab9dc5d09e84b459981101bbd4e498b3d5cad087f45056f8f846fa05076abbdde515a87235b0bea497')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
