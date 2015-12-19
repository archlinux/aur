# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=0.6.5
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("https://github.com/dan-t/$pkgname/archive/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f38bb827ae641f3cc81af248f14647651f5eb2abe34a690267ee16452fac5b4b')

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
