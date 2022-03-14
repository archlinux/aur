# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2022-03-12
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('ee63d0eea86b24fb85ab19110b4b60aac356224f372681f77201e4467fc1c40c3a6ae294eb3671b728c94b3b1bfe64029c037a94db5d1375b5f93dcf130ebb79')

package() {
  cd "$pkgname-$_pkgver"

  ./generate-oxt.sh

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

