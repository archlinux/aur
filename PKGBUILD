# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.9.2
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/watchexec/watchexec'
makedepends=('cargo')
arch=('x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('dcb41cf075d1f07a7274a3b1138dfc585368d1a55595424290988804b58fdb96')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
