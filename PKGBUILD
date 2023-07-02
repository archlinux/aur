# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.3.4
pkgrel=1
pkgdesc="A CLI that displays the status of your pacman mirrorlist and the Arch Linux latest news right in the terminal"
arch=('x86_64')
url='https://github.com/doums/milcheck'
license=('MPL2')
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cargo' 'cmake')
provides=('milcheck')
conflicts=('milcheck')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7bb156bde360827e276a5726d9718eaef05bfda20fe58560b1650cea9b141478')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/milcheck" "$pkgdir/usr/bin/milcheck"
}

