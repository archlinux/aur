# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-cli
pkgver=2.1.2
pkgrel=1
pkgdesc="A command line interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('22ac4f589b3295d098dd8c3dc695466a9def2ff993d82cecfb7af9c98952f96e')

build() {
  cargo build --release --features cli --locked
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/t4l"
}