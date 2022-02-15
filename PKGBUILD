# Maintainer: benbusby <contact at benbusby dot com>

pkgname=colorstorm
pkgver=2.0.0
pkgrel=1
pkgdesc="A color theme generator for editors and terminal emulators"
arch=("x86_64" "i686")
url="https://github.com/benbusby/colorstorm"
license=("MIT")
depends=()
makedepends=("zig>=0.9.0" "make")
conflicts=($pkgname-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/benbusby/colorstorm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("9944a14eeca2759142690fec5c4bd91b243957e242a51fb59484e498fe58467c")

prepare() {
  mv $pkgname-$pkgver $pkgname
}

build() {
  cd $pkgname
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname/zig-out/bin/$pkgname" "$pkgdir/usr/bin/"
}

