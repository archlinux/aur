# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2021-09-01
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('4007fe4f962aa948f382c0bdf004955bddd9c618998837141b82edc3349c0461ed2f518df12e49000e84963241626e6f3c68cb98bf014c13c7e7cc090909d50e')

package() {
  cd "$pkgname-$_pkgver"

  ./generate-oxt.sh

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

