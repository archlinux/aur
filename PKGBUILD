# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.2.1
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b4134918489f8011e42f592e483fe0d7153048c459e05a5c824bbc88474f745e937d4f3c6386e40fb6c7d420b390d83f35ce98d6ea513910b1d415a859ae9270')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
