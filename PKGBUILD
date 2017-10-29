# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-manuelbastionilab
pkgver=1.6.0
pkgrel=1
pkgdesc="powerful 3d humanoids creator"
url="http://www.manuelbastioni.com"
license=("AGPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
_zip="manuelbastionilab_160.zip"
source=("http://download.tuxfamily.org/manuellab/$_zip")
sha256sums=('8d3aebe3c70a069a8d7c349791cb6a547279483139d6ab52c0b48572662d80b9')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip $_zip -d "$addons"
}

