# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-manuelbastionilab
pkgver=1.2.0
pkgrel=1
pkgdesc="powerful 3d humanoids creator"
url="http://www.manuelbastioni.com"
license=("AGPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
_zip="manuelbastionilab_120.zip"
source=("http://download.tuxfamily.org/manuellab/$_zip")
sha256sums=('5c395216e1114260d190ebecec245dd5c19295fba52bb3d9c91cb49febc181ce')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip $_zip -d "$addons"
}

