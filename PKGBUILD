# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=blender-better-collada-git
pkgver=1405.f220183
pkgrel=1
pkgdesc="Better Collada exporter for Blender, made for the Godot Engine"
arch=('any')
url="https://github.com/okamstudio/godot/tree/master/tools/export/blender25"
license=('MIT')
depends=('blender' 'python')
makedepends=('git')
provides=('blender-better-collada')
conflicts=('blender-better-collada')
source=("$pkgname::git://github.com/okamstudio/godot.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  _addondir="$pkgdir/usr/share/blender/2.72/scripts/addons/io_scene_dae"
  install -dm755 $_addondir
  install -Dm644 $srcdir/$pkgname/tools/export/blender25/io_scene_dae/*.py $_addondir
  install -dm755 $pkgdir/share/licenses/$pkgname/licenses
  install -Dm644 $srcdir/$pkgname/LICENSE.md $pkgdir/share/licenses/$pkgname/licenses
}
