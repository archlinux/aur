# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.2.2
pkgrel=1
pkgdesc="A bash script for building custom kernel packages for Arch Linux"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "sed" "sudo" "curl" "coreutils")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("6b679b15a39b6b093141764e0b100ec1bf90d798bdfcb06e5c7d553b4aa65a7cfb140d276305eee08abe4ee6e7a9255dd574e9d389a52faad6a79c57355fa21d")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sudo mkdir -p /etc/kbuilder/hooks
}
