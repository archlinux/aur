# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Rich Li <rich@dranek.com>
pkgname=python-cartopy
pkgver=0.15.0
pkgrel=1
pkgdesc="A cartographic python library with matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/docs/latest/"
depends=('python' 'python-shapely' 'python-pyshp' 'python-pyproj')
makedepends=('python3' 'cython')
license=('LGPL3')
arch=('x86_64')
source=("https://github.com/SciTools/cartopy/archive/v${pkgver}.tar.gz")
md5sums=('98da94b1b1f844b31e679bdfdd6e0d96')

build() {
    cd "$srcdir/cartopy-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/cartopy-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
