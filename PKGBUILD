# Maintainer: doakey3 <doakey3@gmail.com>
pkgname=blender-plugin-bligify
pkgver=1.3.7
pkgrel=1
pkgdesc="Export and import animated GIFs from the Blender VSE"
url="https://github.com/doakey3/Bligify"
license=("GPL")
arch=('any')
depends=('blender' 'gifsicle' 'imagemagick')
groups=('blender')
makedepends=('unzip')
source=("https://github.com/doakey3/Bligify/releases/download/1.3.7/Bligify.zip")
md5sums=('02206091517a19a8983b7214be3328e3')

package() {
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
    unzip Bligify -d "$addons"
}
