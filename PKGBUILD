# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2021-11-10
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('0e7337c11fec1e6521440d89481d056805f4e602508036e45f07754f257f84b6516c010b7fefdae0cc857548c9fb0b5f852cdc849cfe2977c4d7016d0c738e8f')

package() {
  cd "$pkgname-$_pkgver"

  ./generate-oxt.sh

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

