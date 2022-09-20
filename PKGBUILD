# Maintainer: Sergey Feschukov <snfesh@yandex.ru>
# Contributor: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2022-09-04
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip' 'svgo' 'optipng' 'python-cairosvg')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('cd094a48c756bf3f4271b1b15411ae878b7241a14bf1a2199d23b19427ee7200b4a6945fb998f3e2122b083844616645a0a584bf417aebc0e1d63a8a8cd3002f')

package() {
  cd "$pkgname-$_pkgver"

  ./build.sh -e

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "dist/images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

