# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=kartograph-git
pkgver=20130927
pkgrel=1
pkgdesc="A Python library that generates SVG maps from ESRI shapefiles."
url="http://kartograph.org"
arch=('any')
license=('AGPL')
depends=('python2' 'gdal' 'python2-psycopg2' 'python2-lxml' 'python2-pyproj' 'python2-tinycss' 'python2-shapely')
makedepends=('git')
source=('git://github.com/kartograph/kartograph.py.git')
md5sums=('SKIP')
_gitname="kartograph.py"

pkgver() {
    cd "$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
    cd "$_gitname"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
    find "$pkgdir/" -name '*.pyc' -delete
}
