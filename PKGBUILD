# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-cli
pkgver=2.2.1
pkgrel=1
pkgdesc="A command line interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('82e2935583068aa0586cf100c8650ea6078644d39fee8bb343a9dda8677fa198')

build() {
  cargo build --release --features cli --locked
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/t4l"
}