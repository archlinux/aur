# Maintainer: Tobias Baust <tobias.baust at tutanota dot com>
_pkgname=PyFoam-2020.5
pkgname=python-pyfoam
pkgver=2020.5
pkgrel=1
pkgdesc='support for working with the OpenSource CFD-toolbox [OpenFOAM]'
arch=('any')
url='https://pypi.org/project/PyFoam'
license=('GPL3')
depends=(python)
makedepends=(python-setuptools)
install="$pkgname.install"
source=("https://files.pythonhosted.org/packages/65/95/0d27b17db10da615c5aa1061ef3bc4b9c60c68c9c6ebed724b40e4d502a2/${_pkgname}.tar.gz")
md5sums=('2913bf472a49939910b271a1902f75a3')

build() {
    tar xfz "${_pkgname}.tar.gz"
    cd "${_pkgname}"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
