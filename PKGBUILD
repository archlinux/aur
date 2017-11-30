# maintained by: Hui Yiqun <huiyiqun@gmail.com>

name=io-three
pkgname=blender-plugin-${name}
pkgver=r88
pkgrel=1
pkgdesc="Blender addon for exporting Three.js' ASCII JSON format."
arch=('any')
url="https://github.com/mrdoob/three.js/tree/master/utils/exporters/blender"
license=('MIT')
depends=('blender')
makedepends=('git')
source=("${name}::git+https://github.com/mrdoob/three.js.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
  cd ${srcdir}/${name}
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  mkdir -p ${addons}
  cp -r utils/exporters/blender/addons/io_three ${addons} 
}
# vim:set ts=2 sw=2 et:
