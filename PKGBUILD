# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-pbr-materials
pkgver=2.0
pkgrel=2
pkgdesc="Collection of PBR materials"
url="http://3dwolf.weebly.com/materials.html"
license=("CCPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
_zip="pbr_materials.zip"
source=("http://3dwolf.weebly.com/uploads/2/9/9/4/29944523/$_zip")

sha256sums=('a32243146cf3f288723f8c408148088c8833a50fa3787b53cf259622ddb5b6dd')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip $_zip -d "$addons"
}

