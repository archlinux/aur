# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-polygon
pkgver=3.0.7
pkgrel=1
pkgdesc="Python package that handles polygonal shapes in 2D"
arch=('i686' 'x86_64')  # compiles gpc, can't be 'any'
url="http://www.j-raedler.de/projects/polygon/"
depends=('python-numpy')
license=('LGPL' 'custom')
options=(!libtool)
source=("https://bitbucket.org/jraedler/polygon3/downloads/Polygon3-$pkgver.zip")
md5sums=('0888ada8c5db95ae33de7d330551fd27')

prepare() {
    cd "$srcdir/Polygon3-$pkgver"
    sed -i 's|numpy/arrayobject.h|/usr/lib/python3.4/site-packages/numpy/core/include/&|' src/cPolygon.c
}

package() {
    cd "$srcdir/Polygon3-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
}

