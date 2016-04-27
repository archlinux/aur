# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-intelhex
_pkgname=${pkgname/python-/}
pkgver=2.1
pkgrel=1
pkgdesc="Python IntelHex library"
url="https://github.com/bialix/intelhex"
depends=('python' 'python-setuptools')
optdepends=()
license=('BSD')
arch=('any')
source=("https://github.com/bialix/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('af5ee3cb7424d15cf259861dcedf6ca68ecfae0819cb9f5c3437a1c8ff8c2f03486dd9f12b93564a5e2f4b7bab4c055a44c6dbe2a86007165412336bd2a4554f')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/

    # Only install command line tools with python2-intelhex version
    rm -rf ${pkgdir}/usr/bin
}

#package_python2-intelhex() {
#    cd "$srcdir/$_pkgname-$pkgver"
#    python setup.py install --root="$pkgdir" --optimize=1
#    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
#
#    # Only install command line tools with python3 version
#    rm -rf ${pkgdir}/usr/bin
#}
