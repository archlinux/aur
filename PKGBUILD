# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-geopandas
_pkgname=geopandas
pkgver=0.7.0
pkgrel=1
pkgdesc="Geographic pandas extension"
arch=('any')
url="https://github.com/geopandas/geopandas"
license=('BSD')
checkdepends=('python-descartes' 'python-matplotlib' 'python-pytest' 'python-rtree')
depends=('python' 'python-fiona' 'python-numpy' 'python-pandas' 'python-pyproj' 'python-shapely' 'python-six')
optdepends=('python-descartes' 'python-geopy' 'python-psycopg2')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/geopandas/geopandas/archive/v$pkgver.tar.gz")
sha256sums=('7a59954a66b7ab6bf7ff84ee4bed712183286d54d2008a02b0b757ec248e0c75')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
