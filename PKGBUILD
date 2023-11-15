# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.3.5
pkgrel=1
pkgdesc="Bash script for building custom kernels"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "curl" "coreutils" "base-devel")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('069d0acc85d8e35a4ad58d67905bc8272bbcaa1826513b676b722e514d9614aabfc278d8275e51ad19653b24b67e64ba6764308f25aeda33dc0dc1bec0f343b7')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/kbuilder.1.gz" "$pkgdir/usr/share/man/man1/kbuilder.1.gz"
  install -dm644 "$pkgdir/etc/kbuilder/hooks"
}
