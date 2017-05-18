# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.8.4
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/mattgreen/watchexec'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ac5f4baae80de5ae99e44be328b2d9e75672250ba38a8961c90120063fbb3fed')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
