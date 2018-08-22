# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.9.0
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/watchexec/watchexec'
makedepends=('cargo')
arch=('x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('64a3ade996d83facf5d5aad05667425c3c0293dd7dab82e7675af483f59275fd')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
