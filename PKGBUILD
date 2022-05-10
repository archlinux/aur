# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.2.5
pkgrel=2
pkgdesc="Build script for custom kernels"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "sed" "sudo" "curl" "coreutils")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("f44209769d8d0cfc939a548571f9533d02e2db8b688627881342606a864ef2628f4e6ea8932b219cb6241596feb83f83c7d2b1a37f401e43840dff1c2589f824")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/documentation.html" "$pkgdir/usr/share/doc/$pkgname/documentation.html"
  install -Dm644 "$srcdir/$pkgname-$pkgver/kbuilder.1.gz" "$pkgdir/usr/share/man/man1/kbuilder.1.gz"
  sudo mkdir -p /etc/kbuilder/hooks
}
