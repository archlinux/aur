# Maintainer: Tobias Baust <tobias.baust at tutanota dot com>
_pkgname=PyFoam-2021.6
pkgname=python-pyfoam
pkgver=2021.6
pkgrel=1
pkgdesc='support for working with the OpenSource CFD-toolbox [OpenFOAM]'
arch=('any')
url='https://pypi.org/project/PyFoam'
license=('GPL3')
depends=(python)
optdepends=('python-numpy: required by some functions')
makedepends=(python-setuptools)
install="$pkgname.install"
source=("https://files.pythonhosted.org/packages/02/07/c9634828bb6d0f0d92d37a9973b269488f17b5436b6eea8b5ac49e8121ec/${_pkgname}.tar.gz")
md5sums=('87390a05b57b9a85b13679665134a854')

build() {
    tar xfz "${_pkgname}.tar.gz"
    cd "${_pkgname}"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
