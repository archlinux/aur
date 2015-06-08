# Maintainer: Carl George < arch at cgtx dot us >

_name="falcon"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.3.0"
pkgrel="1"
pkgdesc="An unladen web framework for building APIs and app backends."
arch=("any")
url="https://github.com/falconry/${_name}"
license=("Apache")
makedepends=("cython"
             "python-setuptools"
             "cython2"
             "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f27602b5a2ff8ee40b3179b3f5bdb9af09efbcd9af9bb7f01ad6a28ad0fc3b82')

package_python-falcon() {
    depends=("python-six>=1.4.0"
             "python-mimeparse")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-falcon() {
    depends=("python2-six>=1.4.0"
             "python2-mimeparse")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
