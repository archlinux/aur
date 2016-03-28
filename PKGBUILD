# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=0.7.0
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("https://github.com/dan-t/$pkgname/archive/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('68cb6e19e4a3b13cb374a365969cc92e5c850eb157562cfa4f0bbe2e607b6cd1')

prepare() {
  mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
