# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-manuelbastionilab
pkgver=1.1.0
pkgrel=1
pkgdesc="powerful 3d humanoids creator"
url="http://www.manuelbastioni.com/manuellab.php"
license=("AGPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
source=("http://download.tuxfamily.org/manuellab/manuelbastionilab_110.zip")
md5sums=('b791d4f80616c7c3e239aa59d79bded7')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip manuelbastionilab_110.zip -d "$addons"
}

