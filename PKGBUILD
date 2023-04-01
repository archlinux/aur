# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.3.2
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
sha256sums=('41ef3fba6aadf43a117520ffa4e93efb6e7922d715b0afd3dc1788cd80424d30')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/milcheck" "$pkgdir/usr/bin/milcheck"
}

