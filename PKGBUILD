# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2022-04-09
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('8f76bd4f8d972aeb483908682d4c82839f7f79576c55f789066439632a128d5504f6cb8edb439a5880ff7f9c95862d514e887d68300b979777041c7a590b81ec')

package() {
  cd "$pkgname-$_pkgver"

  ./generate-oxt.sh

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

