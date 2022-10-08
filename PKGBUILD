# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyionice
pkgver=1.0.4
pkgrel=1
pkgdesc='Drop-in replacement for ionice from util-linux in just 300 lines of C'
arch=(x86_64)
url='https://github.com/xyproto/tinyionice'
license=(GPL2)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('e74591c660ad6abb446db293a99d57f82da0ff6180f999d8126cb05cfc9c0f4851f86a052202c3b5e50eb48e993bc1d00afc1cb819ef0cdbe5830544289a32b0')

build() {
  make -C $pkgname-$pkgver
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname-$pkgver install
}
