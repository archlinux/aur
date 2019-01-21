# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=caire
pkgver=1.2.0
pkgrel=1
pkgdesc="Content aware image resize library based on Seam Carving"
arch=('x86_64' 'i686')
url="https://github.com/esimov/caire"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/esimov/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./build.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('3557c3511cb776ddda9b5285a8a72a9d40f6db94629f60e210e71e055f80593f')
