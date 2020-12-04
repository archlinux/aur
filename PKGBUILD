# Maintainer: Paul Seyfert <pseyfert.mathphys@gmail.com>

pkgname=python-tilemapbase-git
pkgver=r55.85665c2
pkgrel=1
pkgdesc="Use OpenStreetMap tiles as basemaps in python / matplotlib"
arch=(any)
url="https://github.com/MatthewDaws/TileMapBase"
license=('MIT')
depends=('python-requests' 'python-pillow')
optdepends=('python-pyproj')
source=(git+https://github.com/MatthewDaws/TileMapBase.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/TileMapBase || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/TileMapBase"
  python setup.py install --root="$pkgdir/" --optimize=1
}
