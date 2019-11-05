# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-geopandas
_pkgname=geopandas
pkgver=0.6.1
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
sha256sums=('07bd4427e28dccfaa5d2239c38896e1823d5dfddb151e8a266197b5595b3c2e5')

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
