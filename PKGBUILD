# Maintainer: Letu Ren <fantasquex at gmail dot com>

pkgname=python-pyxbe
pkgver=0.0.3
pkgrel=1
pkgdesc="Library to work with XBE files"
arch=('any')
url="https://github.com/mborgerson/pyxbe"
license=('MIT')
depends=('python')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c60435c877173f07fa83e5422ca7f40a10552f70a84c4c94c83b78768910d96d')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
