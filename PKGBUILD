# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.8.0
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/mattgreen/watchexec'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('57579971a698a6f846e78358cfd5048e4baeed0bface50fe7d8f95c56beb3eef')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
