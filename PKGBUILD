# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-geopandas
_pkgname=geopandas
pkgver=0.9.0
pkgrel=1
pkgdesc="Geographic pandas extension"
arch=('any')
url="https://github.com/geopandas/geopandas"
license=('BSD')
checkdepends=('python-descartes' 'python-matplotlib' 'python-pytest' 'python-rtree')
depends=('python-fiona' 'python-numpy' 'python-pandas' 'python-pyproj' 'python-shapely')
optdepends=('python-pyarrow' 'python-descartes' 'python-geopy' 'python-psycopg2')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/geopandas/geopandas/archive/v$pkgver.tar.gz")
sha256sums=('b315da3347f0b1847a30df6ea7bbb4e690b18e762da8fa9f32a166afe98b91dc')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
