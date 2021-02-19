# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.1.4
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('999a7239e37b4a66480d74833ca4bce3cb0c95c283c8233336a2f33951587c9c03b9a0c3e5623d18c0bf853470854accd14dd66f7e3bbf40195106f92f095cc8')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
