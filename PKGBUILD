# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-geopandas
_pkgname=geopandas
pkgver=0.2.1
pkgrel=1
pkgdesc="Geographic pandas extension"
arch=('any')
url="https://github.com/geopandas/geopandas"
license=('BSD')
checkdepends=('python-nose' 'python-descartes')
depends=('python' 'python-numpy' 'python-pandas' 'python-shapely' 'python-fiona' 'python-six' 'python-pyproj')
optdepends=('python-geopy' 'python-psycopg2' 'python-descartes' 'python-rtree')
options=(!emptydirs)
source=("https://github.com/geopandas/geopandas/archive/v$pkgver.tar.gz")
sha256sums=('1e1845acbf6cf8dd2850aec9bfaa92892e462887903e3ea1abb8111e88a41206')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
}

#check() {
#    cd "$srcdir/$_pkgname-$pkgver"
#    nosetests
#}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
