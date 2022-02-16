# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=2.0.0
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9b985fef0fa42cd97c8c6385a671fe84011dd072ec33c1af2840ed78563ba3612fc21f626354aa42f8014d7b7f1b33b3224c2fac9ddb3121d6848cf2f5b53d21')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
