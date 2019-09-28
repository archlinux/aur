# Maintainer: Duncan X Simpson <duncan@k7dxs.net>

pkgname=python-toomanyobjs
pkgver=1.1.0
pkgrel=1
pkgdesc="Share and store Python objects"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/beardog108/toomanyobjects"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/d1/bd/92896d429abcfb10ebd4522b0728c6e555fe665c2fd4629b1d18ca78db34/toomanyobjs-1.1.0.tar.gz")
md5sums=('4d3d3ed98224d49844095f0f3c8bf411')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Building...'
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Installing...'
    python setup.py install --root="$pkgdir" --optimize=1
}
