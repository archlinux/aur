# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=wine_gecko-stable
pkgver=2.47
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's Internet Explorer (for wine-stable)"
arch=(i686 x86_64)
url="http://wiki.winehq.org/Gecko"
license=(MPL)
depends=('wine-stable')
provides=('wine_gecko')
conflicts=('wine_gecko')
source=(http://dl.winehq.org/wine/wine-gecko/$pkgver/wine_gecko-$pkgver-x86.msi)
source_x86_64=(http://dl.winehq.org/wine/wine-gecko/$pkgver/wine_gecko-$pkgver-x86_64.msi)
sha256sums=('3b8a361f5d63952d21caafd74e849a774994822fb96c5922b01d554f1677643a')
sha256sums_x86_64=('c565ea25e50ea953937d4ab01299e4306da4a556946327d253ea9b28357e4a7d')

package() {
  _geckodir="$pkgdir/usr/share/wine/gecko"

  install -Dm644 wine_gecko-$pkgver-x86.msi "$_geckodir/wine_gecko-$pkgver-x86.msi"
  if [[ $CARCH == x86_64 ]]; then
    install -m644 wine_gecko-$pkgver-x86_64.msi "$_geckodir/"
  fi
}
