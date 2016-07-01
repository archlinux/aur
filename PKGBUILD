# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=blendercam-git
pkgver=r494.d8c1696
pkgrel=1
pkgdesc="An open source solution for artistic CAM"
license=("GPL2")
arch=(any)
depends=('blender' 'python' 'python-shapely' 'python-numpy')
url="http://blendercam.blogspot.com/"
install="blendercam-git.install"
source=("git+https://github.com/vilemnovak/blendercam.git")
md5sums=('SKIP')

pkgver() {
  cd blendercam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/blendercam
  mkdir -p "$pkgdir/usr/share/blender/2.77/"
  cp -r scripts "$pkgdir/usr/share/blender/2.77/"
}
