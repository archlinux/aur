# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Rich Li <rich@dranek.com>
pkgname=python-cartopy
pkgver=0.17.0
pkgrel=1
pkgdesc="A cartographic python library with matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/docs/latest/"
depends=('python-numpy' 'python-six' 'python-shapely' 'python-pyshp' 'python-pyproj')
optdepends=('python-fiona: faster shapefile reading'
            'python-matplotlib: generate plots'
            'python-gdal: for use with SRTM data'
            'python-pillow'
            'python-scipy'
            'python-owslib: access OGC clients')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest' 'python-filelock')
license=('LGPL3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SciTools/cartopy/archive/v${pkgver}.tar.gz")
md5sums=('9fe063295a9fd854803d3c01a60720d0')
sha1sums=('f9936ca8639d46a5c265652e383c6d7cabd20c58')
sha256sums=('137642e63952404ec0841fa0333ad14c58fbbf19cca2a5ac6a38498c4b4998fb')

build() {
    cd "$srcdir/cartopy-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/cartopy-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
