# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgbase=python-flask-paginate
pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://pypi.org/project/flask-paginate"
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl")
sha512sums=(5e94852598b3ab38eb734655a8ded9b72030bc2102d0c65cfa23bf6be4d201424b67a83110d3a0e228220199b4ec71b65dd1ec5f06952c403a40146c6023f98e)

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
