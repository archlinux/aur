# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.2.5
pkgrel=1
pkgdesc="Build script for custom kernels"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "sed" "sudo" "curl" "coreutils")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("66b1eb15975c2b60d4501d297c8b3ea17d20db4caf759d67163c30855ff1b171b62669802492807c290d57937eeb6a64be6b2ed4356fb3503d8ca4e84532d8a6")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/documentation.html" "$pkgdir/usr/share/doc/$pkgname/documentation.html"
  install -Dm644 "$srcdir/$pkgname-$pkgver/kbuilder.1.gz" "$pkgdir/usr/share/man/man1/kbuilder.1.gz"
  sudo mkdir -p /etc/kbuilder/hooks
}
