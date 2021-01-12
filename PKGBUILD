# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgbase=python-flask-paginate
pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://pypi.org/project/flask-paginate"
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl")
sha512sums=(21d4fcd08c562a3cf3181d2255ea7b85b261d2d980bf94ba5c90ae6fec0ed79add69758fe193be6c1287016773eb3b3d31426c07b38135fc7aa9bdb3bec3bddb)

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
