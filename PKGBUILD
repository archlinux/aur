pkgname=blender-plugin-hdri-lighting-shortcut
pkgver=1
pkgrel=1
_blender=$(blender --version | grep -Po 'Blender \K[0-9]\...')
pkgdesc="This is BLAM, a camera calibration toolkit for Blender in the form of an add-on, written in python, that facilitates modeling based on photographs."
arch=('any')
url="http://stuffmatic.github.io/"
license=('GPL')
depends=('blender')
makedepends=('coreutils')
conflicts=()
_h=ccef70cb7822e1a4826019ce798d2848e3a79b72
source=(https://github.com/Nikos-Prinios/HDRI-lighting-Shortcut/archive/$_h.zip)
md5sums=(d8f5cece542b510e77be7a7ad3ae0d9c)

package() {
  mkdir -p "$pkgdir/usr/share/blender/$_blender/scripts/addons/"
  cd "HDRI-lighting-Shortcut-$_h"
  cp -r . "$pkgdir/usr/share/blender/$_blender/scripts/addons/hdri_lighting_shortcut"
}
