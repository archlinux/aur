# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=aurs
pkgver=0.5.0
pkgrel=1
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/hpdeifel/aurs"
license=('GPL3')
depends=('sudo' 'ranger' 'git' 'pacman')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/hpdeifel/$pkgname/repository/v$pkgver/archive.tar.gz")
sha256sums=('ff52710430a86031da39292a79fabdf055ec2923c40c523ab2e4b694c2600ed4')

build() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  install -D "target/release/aurs" -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
