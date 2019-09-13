# Maintainer: Ronald van Engelen <ronalde+gitlab@lacocina.nl>

pkgname=alsa-capabilities
pkgver=v1.0.2
pkgrel=1
pkgdesc="List alsa output interfaces and their capabilities and properties"
arch=(any)
url="https://gitlab.com/sonida/alsa-capabilities"
license=(GPL3)
#makedepends=()
depends=(bash alsa-utils)
options=(!emptydirs !makeflags zipman)
source=($url/-/archive/$pkgver/alsa-capabilities-$pkgver.tar.gz)
sha256sums=('dc549746d28650578cf1d0ac66e80a7ab8d4f5da3ac5d10b7634f77c1cf58e92')
validpgpkeys=(4888EA1E1DD158ED3BC39838FBF05DDFC04DF16B)
#changelog=CHANGELOG

build() {
  echo "BUILD  : pwd           =\`$(pwd)'"
  echo "BUILD  : pkgdir        =\`$pkdir'"
  echo "BUILD  : srcdir        =\`$srcdir'"
  echo "BUILD  : pkgname-pkgver=\`$pkgname-$pkgver'"
  cd "$pkgname-$pkgver"
  make PREFIX="${srcdir}/usr" install
}

package() {
  echo "PACKAGE: pwd           =\`$(pwd)'"
  echo "PACKAGE: pkgdir        =\`$pkdir'"
  echo "PACKAGE: srcdir        =\`$srcdir'"
  echo "PACKAGE: pkgname-pkgver=\`$pkgname-$pkgver'"
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

