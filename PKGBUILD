# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=aurs
pkgver=0.4.1
pkgrel=1
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/hpdeifel/aurs"
license=('GPL3')
depends=('sudo' 'ranger' 'git' 'pacman')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/hpdeifel/$pkgname/repository/v$pkgver/archive.tar.gz")
sha256sums=('efd27c456d1517e28d3305c14a5e4ded4e87a9fbb53198f8a51ad82890ef9e33')

build() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  install -D "target/release/aurs" -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
