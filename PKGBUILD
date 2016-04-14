# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=0.8.1
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("https://github.com/dan-t/$pkgname/archive/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fa578eca2410257038557118ca54aa70d3e6834c8b47db920bb447ef5f819053')

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
