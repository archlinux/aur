# Maintainer: Jokler <aur@jokler.xyz>

pkgname=bacon
pkgver=1.1.8
pkgrel=1
pkgdesc='A background rust code checker'
arch=('x86_64')
url=https://github.com/Canop/bacon
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4830c5199882ed23150b0a1a4c4e46241d7c506783446900c2780980923c9943eae878eac5d0e9f99cc16021764945447287ad82341b3725c3bf536dca9053a8')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/bacon "$pkgdir"/usr/bin/bacon
}

# vim:set ts=2 sw=2 et:
