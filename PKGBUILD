# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=aurs
pkgver=0.1.0
pkgrel=1
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/hpdeifel/aurs"
license=('GPL3')
depends=('sudo' 'ranger' 'git' 'pacman')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/hpdeifel/$pkgname/repository/v$pkgver/archive.tar.gz")
sha256sums=('9d82f95295bc73d91e420186e115fb6231ebde8550116e3ea7c487e941745fe8')

build() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  install -D "target/release/aurs" -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
