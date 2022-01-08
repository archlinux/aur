# Maintainer: Daniel Maier <ifany.net at protonmail dot com>

pkgname=blender-plugin-mhx
pkgver=2
pkgrel=3
_blender_version=3.0
pkgdesc="MHX (blender/makehuman interchange format) importer for blender"
arch=('any')
url="http://www.makehumancommunity.org/"
license=('GPLv2')
source=("https://download.tuxfamily.org/makehuman/plugins/mhx-blender-latest.zip")
#looks like being (currently) daily updated, even the latest one
#relying on direct version numbering broken the other day
sha512sums=('SKIP')

prepare(){
  cd $srcdir
  mv README.md import_runtime_mhx2
}

package() {
  install -d "$pkgdir/usr/share/blender/$_blender_version/scripts/addons"
  mv "$srcdir/import_runtime_mhx2" "$pkgdir/usr/share/blender/$_blender_version/scripts/addons"
}
