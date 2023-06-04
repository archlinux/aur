# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.3.3
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
sha256sums=('54090fcd8c8b66a5f7a464ae8c8e5b024ec5ec90394f4e7a7a2a0cbba3a28a30')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/milcheck" "$pkgdir/usr/bin/milcheck"
}

