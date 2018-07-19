# Maintainer: Oliver Sherouse <oliver@oliversherouse.com>

pkgname=python-semver
_name=${pkgname#python-}
pkgver=2.8.1
pkgrel=1
pkgdesc="Python helper for Semantic Versioning (http://semver.org/)"
arch=("any")
url="https://pypi.python.org/pypi/semver"
license=('BSD')
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('dc579ba9d0bb2137bad5324d4bdb7e40')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim: ft=sh
