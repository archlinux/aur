# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=kbuilder
pkgver=0.2.4
pkgrel=3
pkgdesc="Build script for custom kernels"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("bash" "pacman" "run-parts" "sed" "sudo" "curl" "coreutils")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("af8981ff69acfe2c14f5f4e34c4158b605c650461bb073f33e8c48fd1a4f0adb11ad0153ca6421d0f32ea56a387f953204e1ba39b260577c3d050910375f84e3")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/documentation.html" "$pkgdir/usr/share/doc/$pkgname/documentation.html"
  install -Dm644 "$srcdir/$pkgname-$pkgver/kbuilder.1.gz" "$pkgdir/usr/share/man/man1/kbuilder.1.gz"
  sudo mkdir -p /etc/kbuilder/hooks
}
