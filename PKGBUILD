# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.2.4
pkgrel=1
pkgdesc="A small binary that displays the status of your pacman mirrorlist in your terminal"
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/doums/milcheck/archive/refs/tags/v$pkgver.tar.gz")
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
md5sums=('50c81d46d59b71b05a7086a8ba913654')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
