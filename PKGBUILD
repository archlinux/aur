# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.10.0
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/watchexec/watchexec'
makedepends=('cargo')
arch=('x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7ef8efe1565c9177222cb1e13ac227d26aa3ba5395399c4201177c9db329241f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
