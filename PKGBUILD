# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-archimesh
pkgver=1.1.2
pkgrel=3
pkgdesc="Blender add-on for creating architecture elements."
url="https://github.com/Antonioya/blender/tree/master/archimesh"
license=("GPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
source=("https://github.com/Antonioya/blender/raw/master/archimesh/archimesh_v1_1_2.zip")
md5sums=('5aa0f2c2e7ecfec01957b809674c3409')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip archimesh_v1_1_2.zip -d "$addons"
}

