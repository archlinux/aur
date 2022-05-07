# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.2.3
pkgrel=1
pkgdesc="A bash script for building custom kernel packages for Arch Linux"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "sed" "sudo" "curl" "coreutils")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("41a284ff65708f05dfafa0cbc53049300b0ac674686db8adda4c0f77a464f54674a68012bbe76171830b55829491bbb53dd6f805cdfa4599c4f0bce26a87e608")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sudo mkdir -p /etc/kbuilder/hooks
}
