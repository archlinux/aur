# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-polygon
pkgver=3.0.9.1
pkgrel=1
pkgdesc="Python package that handles polygonal shapes in 2D"
arch=('i686' 'x86_64')  # compiles gpc, can't be 'any'
url="http://www.j-raedler.de/projects/polygon/"
depends=('python-numpy')
license=('LGPL' 'custom')
options=(!libtool)
source=("https://files.pythonhosted.org/packages/source/P/Polygon3/Polygon3-$pkgver.tar.gz")
md5sums=('bf90292fcb4902a346aafe27ec46a1d5')

prepare() {
    cd "$srcdir/Polygon3-$pkgver"
    #sed -i 's|numpy/arrayobject.h|/usr/lib/python3.10/site-packages/numpy/core/include/&|' src/cPolygon.c
}

build() {
    cd "$srcdir/Polygon3-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/Polygon3-$pkgver"
    python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
}

