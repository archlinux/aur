# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.3.1
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
sha256sums=('b27af6d9b2fbecd400592c53883fbfe41e07a79ebf28da6f43d6067d77123e54')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/milcheck" "$pkgdir/usr/bin/milcheck"
}

