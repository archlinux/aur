# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.2.9
pkgrel=1
pkgdesc="A simple CLI that displays the status of your pacman mirrorlist and the Arch Linux latest news right in the terminal"
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/doums/milcheck/archive/refs/tags/v$pkgver.tar.gz")
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cmake')
sha256sums=('257d456bf6a166871207a8c9cb1382f5da0234c2372f5bfa9ec2694011f815c5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
