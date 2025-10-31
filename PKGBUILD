# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-cli
pkgver=2.1.0
pkgrel=1
pkgdesc="A command line interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('35339c7d60dedb8dfa933da2266099f78e4874619aa1fe69f9943d6096205550')

build() {
  cargo build --release --features cli --locked
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/t4l"
}