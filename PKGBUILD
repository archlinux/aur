# Maintainer: Jan <jan@nexttrex.de>
#
# You have to purchase this icon theme first:
#
# https://numixproject.org/store/index.php?route=product/product&product_id=51
#
# Then place the numix_square.zip into this directory

pkgname=numix-icon-theme-square
pkgver=2014.10.14
pkgrel=1
pkgdesc="A square-ish shaped icon theme from the  Numix Project"
arch=('any')
url='https://numixproject.org/'
license=('custom')
depends=('numix-icon-theme-git')
source=('file://numix_square.zip')
md5sums=('a471f9a10d4c6db318bd7409542b64c2')
DLAGENTS+=("file::/usr/bin/echo Unable to find %u. You need to download this file manually to \"$PWD\".")
options=('!strip')

# needed to preserve linkname
makedepends=('unzip')
noextract=('numix_square.zip')

build() {
  # Some Files somehow fail to extract
  unzip -ou "numix_square.zip" || true
}

package() {
  install -dm755 "$pkgdir/usr/share/icons/"
  cp -r "Numix-Square" "$pkgdir/usr/share/icons/"
  cp -r "Numix-Square-Light" "$pkgdir/usr/share/icons/"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
