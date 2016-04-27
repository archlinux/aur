# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-miratools
pkgver=6.4.27 # Y.M.D
pkgrel=1
_h="238cd26c7ec0ee5c31318cd27344e410b0c9bca4"
pkgdesc="Modern modeling and retopology tools"
url="https://github.com/mifth/mifthtools/wiki/Mira-Tools"
license=("GPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
source=("https://github.com/mifth/mifthtools/archive/$_h.zip")
md5sums=('f5df06f9e53b7c3d57f8620c6d8361a5')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    cp -r "$srcdir/mifthtools-$_h/blender/addons/"* "$addons"
}

