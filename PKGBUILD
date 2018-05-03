# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=aurs
pkgver=0.4.0
pkgrel=1
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/hpdeifel/aurs"
license=('GPL3')
depends=('sudo' 'ranger' 'git' 'pacman')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/hpdeifel/$pkgname/repository/v$pkgver/archive.tar.gz")
sha256sums=('7a0715f55f3f74debf0e3c266854d703883dcc427a64e8d3b14b92268676e44b')

build() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  install -D "target/release/aurs" -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
