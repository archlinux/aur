# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.1.6
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('83338f533d76713fb8707900f8bb981d0577a19665a8a035686d97d4dfb8c243db9fb52dd78502be882cfebde4d13ffb39251371d3562ce6481c1b4e3159052c')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
