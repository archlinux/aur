# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2023-07-04
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip' 'svgo' 'optipng' 'python-cairosvg')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('0999b103866d13a405f38871c8a6d77df1cff71109e2ea434da426b72c9412bbdc82674dfc8a1491a104fa41d9df4fb5fc4956851efb73faf84d00629b3dd348')

package() {
  cd "$pkgname-$_pkgver"

  ./build.sh -e

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "dist/images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

