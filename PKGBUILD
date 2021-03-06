# Maintainer: Éric Gillet <e+aur@linuxw.info>

_py_pkgname=pymp4
_github_url=https://github.com/beardypig/$_py_pkgname
pkgname=python-${_py_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python MP4 Parser and toolkit"
arch=(any)
url="https://github.com/beardypig/pymp4"
license=('Apache') #2.0
depends=(python "python-construct<2.9")
makedepends=(python-setuptools)
checkdepends=(python-pytest python-wheel)
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py test
}

package() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
