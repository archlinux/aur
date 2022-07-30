# Maintainer: Your Maksim <maxgoonfuture@gmail.com>
pkgname=mcalc
pkgver=2.3.0
pkgrel=1
pkgdesc="MCalc - calculator for performing simple mathematical operations in all existing number systems"
arch=('x86_64')
url="https://github.com/nesterovmaxim31/MCalc"
license=('MIT')
depends=(qt5-base)
makedepends=(git gcc extra-cmake-modules cmake)
changelog=
source=("$pkgname-$pkgver::https://github.com/nesterovmaxim31/MCalc/archive/v$pkgver.tar.gz")
md5sums=('e7b37749c649f082b28f8e3ab4cbd1d2')
validpgpkeys=()



build() {
  cd "MCalc-$pkgver"
  cmake . && make
}


package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/MCalc-$pkgver/mcalc" "$pkgdir/usr/bin/mcalc"
  chmod +x "$pkgdir/usr/bin/mcalc"
  # --------------------------------------------------------------------------------------------------------
  install -Dm644 "$srcdir/MCalc-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/MCalc-$pkgver/$pkgname.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
