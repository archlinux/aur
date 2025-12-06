# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-cli
pkgver=2.2.0
pkgrel=1
pkgdesc="A command line interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('201035002f703bb95ef27b1a00c7622402f89f610c9fbff3c002aa1d498eb01d')

build() {
  cargo build --release --features cli --locked
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/t4l"
}