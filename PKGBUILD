# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-geopandas
_pkgname=geopandas
pkgver=0.5.0
pkgrel=1
pkgdesc="Geographic pandas extension"
arch=('any')
url="https://github.com/geopandas/geopandas"
license=('BSD')
checkdepends=('python-descartes' 'python-matplotlib' 'python-pytest' 'python-rtree')
depends=('python' 'python-fiona' 'python-numpy' 'python-pandas' 'python-pyproj' 'python-shapely' 'python-six')
optdepends=('python-descartes' 'python-geopy' 'python-psycopg2')
options=(!emptydirs)
source=("https://github.com/geopandas/geopandas/archive/v$pkgver.tar.gz")
sha256sums=('ac0f1aa5489bd02b29b57c80defba5088914100bef2ecf84ee0ea616282aaa49')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
