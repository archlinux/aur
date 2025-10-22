# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-cli
pkgver=2.0.3
pkgrel=1
pkgdesc="A command line interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('56a2af8a39527cb8cb352083ce0da28e744efa452b2f0b84bbdea0348c4f3ee7')

build() {
  cargo build --release --features cli --locked
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/t4l"
}