# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-manuelbastionilab
pkgver=1.3.0
pkgrel=1
pkgdesc="powerful 3d humanoids creator"
url="http://www.manuelbastioni.com"
license=("AGPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
_zip="manuelbastionilab_130.zip"
source=("http://download.tuxfamily.org/manuellab/$_zip")
sha256sums=('e45094bfd90d40c65a7b128640d13628ef01f6ba21b2fe59e248cba8d02a85df')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip $_zip -d "$addons"
}

