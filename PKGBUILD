# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=silver
pkgver=1.1.0
pkgrel=1
pkgdesc="A cross-shell customizable powerline-like prompt with icons"
arch=('x86_64')
url="https://github.com/reujab/silver"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('aea70c0485e1e5501098560d0fd2561a0cd425c39a1dd91c8e8328fdafdd538655f80ca4e212fce289a1a8bcc789ba5bbb7550a02a1f07512b6f43906ead6174')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 license -t "$pkgdir/usr/share/licenses/$pkgname"
}
