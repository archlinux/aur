# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.8.1
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/mattgreen/watchexec'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('22937d69897b21c9dd24c6c1db59859689ff81ea4a8d5fe11b901fa285d005c9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
