# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.2.6
pkgrel=1
pkgdesc="A simple program that displays the status of your pacman mirrorlist and the Arch Linux lastest news right in your terminal"
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/doums/milcheck/archive/refs/tags/v$pkgver.tar.gz")
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cmake')
md5sums=('9b8d627e803067a0a7aeddbd5a77428c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
