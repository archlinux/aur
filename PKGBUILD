# Maintainer: Carl George < arch at cgtx dot us >

_name="apache-libcloud"
_module="${_name#apache-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.17.0"
pkgrel="2"
pkgdesc="A standard Python library that abstracts away differences among multiple cloud provider APIs."
arch=("any")
url="https://libcloud.apache.org"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8ac4895c5ed2fa51812237dfd587675e3cbc4b7e57d9b44722ce849eab2131c2')

package_python-libcloud() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-libcloud() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
