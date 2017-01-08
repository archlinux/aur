# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-manuelbastionilab
pkgver=1.4.0
pkgrel=2
pkgdesc="powerful 3d humanoids creator"
url="http://www.manuelbastioni.com"
license=("AGPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
_zip="manuelbastionilab_140a.zip"
source=("http://download.tuxfamily.org/manuellab/$_zip")
sha256sums=('1f8460e79c5ccef4e15284acf522c33d700df60c0cdd8b28d176794f7cdf03a0')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip $_zip -d "$addons"
}

