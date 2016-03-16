pkgname=blender-plugin-blam
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
source=(http://stuffmatic.github.com/downloads/blam/blam_0.6.zip)
md5sums=(40a1e3eb94faa8e4ec6c9ea41cf8a35b)

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/blender/$_blender/scripts/addons/"
  cp blam.py "$pkgdir/usr/share/blender/$_blender/scripts/addons/"
}