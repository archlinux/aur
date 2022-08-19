# Maintainer: Sergey Feschukov <snfesh@yandex.ru>
# Contributor: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2022-08-15
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=('zip' 'svgo' 'optipng' 'python-cairosvg')
source=(https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz)
sha512sums=('bc75ab3faf10a6b49bf75c352b9a9ffaa1661af4777f70e49541934c471240e66fff3207459357a1ac979806764fd80b4ca5f6dbcd5eb66c96e444db5382bcbd')

package() {
  cd "$pkgname-$_pkgver"

  ./build.sh -e

  install -vd "$pkgdir/usr/lib/libreoffice/share/config/"

  install -v "dist/images_yaru.zip"          "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_svg.zip"      "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_mate.zip"     "$pkgdir/usr/lib/libreoffice/share/config/"
  install -v "dist/images_yaru_mate_svg.zip" "$pkgdir/usr/lib/libreoffice/share/config/"

}

