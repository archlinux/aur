# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.3.6
pkgrel=1
pkgdesc="Bash script for building custom kernels"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "curl" "coreutils" "base-devel")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('743354f90d7b9d5e7a992ed736e4c1ca7104981148a0dab9da634861b287bf6dd851d0f4e41265d1888ca8935f852c89fa6b9c464e23b2937fd76830a0b2c718')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/kbuilder.1.gz" "$pkgdir/usr/share/man/man1/kbuilder.1.gz"
  install -dm644 "$pkgdir/etc/kbuilder/hooks"
}
