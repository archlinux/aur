# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.2.1
pkgrel=1
pkgdesc="A bash script for building custom kernel packages for Arch Linux"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "sed" "sudo" "curl" "coreutils")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("be50c9a1ae6366d01ccb065ef7090f440125756faf5f5d48c8a1f58556d58f7154c412097435f80fa34edc4b9028d7df24078d6f513bffc8196f1212a4f34f9a")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sudo mkdir -p /etc/kbuilder/hooks
}
