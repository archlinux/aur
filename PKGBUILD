# Maintainer: Daniel Maier <ifany.net at protonmail dot com>

pkgname=blender-plugin-mhx
pkgver=2
pkgrel=4
# this may stop working so please insert your current /usr/share/blender/$blender_version
_blender_version=$(pacman -Qi blender | grep Version | cut -b 22-24)
pkgdesc="MHX (blender/makehuman interchange format) importer for blender"
arch=('any')
url="http://www.makehumancommunity.org/"
license=('GPLv2')
depends=('blender')
source=("https://download.tuxfamily.org/makehuman/plugins/mhx-blender-latest.zip")
sha512sums=('SKIP')

prepare(){
  cd $srcdir
  mv README.md import_runtime_mhx2
}

package() {
  install -d "$pkgdir/usr/share/blender/$_blender_version/scripts/addons"
  mv "$srcdir/import_runtime_mhx2" "$pkgdir/usr/share/blender/$_blender_version/scripts/addons"
}
