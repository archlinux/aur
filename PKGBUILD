# Maintainer: zackartz <zackartz@lavabit.com>
# Contributor: orhun <orhunparmaksiz@gmail.com>

pkgname=silver
pkgver=2.0.0
pkgrel=1
pkgdesc="A cross-shell customizable powerline-like prompt with icons"
arch=('x86_64')
url="https://github.com/reujab/silver"
license=('Unlicense')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3ef3ce7c8139f42b542c025c374259ca4bece16e7b4cb45485eeba0622f091e5778d86208f7786493cf0e11f1843f6db4f136a188193b2df8ae46795200cf96e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
