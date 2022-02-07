# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgdesc="A tile cache and WMS proxy."
pkgbase=python-mapproxy
pkgname=('python-mapproxy')
pkgver=1.14.0
pkgrel=1
arch=('any')
url="https://github.com/mapproxy/mapproxy"
license=('APACHE')
makedepends=('python-setuptools')
source=("mapproxy-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a47eeaf6211424694f9af43599f26da2546da866299a0048a2a6eb414869388c')
depends=('python' 'python-pillow' 'python-yaml' 'python-pyproj')
optdepends=('python-shapely: coverage feature support'
            'python-gdal: OGR datasource support'
            'python-lxml: more advanced WMS FeatureInformation support')

build() {
  cd $srcdir/mapproxy-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/mapproxy-${pkgver}
  python setup.py install --root=$pkgdir/
}
