# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-manuelbastionilab
pkgver=1.0.0
pkgrel=1
pkgdesc="powerful 3d humanoids creator"
url="http://www.manuelbastioni.com/manuellab.php"
license="AGPL"
arch=('any')
depends=('blender')
makedepends=('unzip')
source=("http://download.tuxfamily.org/manuellab/manuellab_100.zip")
md5sums=('f8577b1cf2ce17f591819d556cd3d9a9')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip manuellab_100.zip -d "$addons"
}

