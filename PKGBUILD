# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=0.6.8
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("https://github.com/dan-t/$pkgname/archive/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ddb5f3202f086a8e2b9af6db62292b03a93f16a8d82852683135a477bae758be')

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
