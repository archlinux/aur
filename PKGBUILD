# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=aurs
pkgver=0.4.2
pkgrel=1
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/hpdeifel/aurs"
license=('GPL3')
depends=('sudo' 'ranger' 'git' 'pacman')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/hpdeifel/$pkgname/repository/v$pkgver/archive.tar.gz")
sha256sums=('25a3617e7a870ea5ba7e86622391207eb9c9d00618952a100b3520e1bac54e8a')

build() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  install -D "target/release/aurs" -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
