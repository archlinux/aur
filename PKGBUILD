# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=2.0.1
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b5b0797162ca522b7b29d545bbcc8ae8077efff1886c2164d6623ac44b2677809546e507c994841bcc46be019ab28a9fbcd14967b459a3f01259767385f724a1')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
