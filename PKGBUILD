# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2022-01-20
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('11701a71f4865754388babac25dad2116797cf3153b352b59ba60e22109dcc5777962b9e046341efeeb1693ea877595105c7891f621fa2f7df0dac17e5890f9e')

package() {
  cd "$pkgname-$_pkgver"

  ./generate-oxt.sh

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

