# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.2.5
pkgrel=1
pkgdesc="A small binary that displays the status of your pacman mirrorlist in your terminal and optionally the lastest news"
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/doums/milcheck/archive/refs/tags/v$pkgver.tar.gz")
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cmake')
md5sums=('810b00a8b23eea2ef0a36989ff37aef2')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
