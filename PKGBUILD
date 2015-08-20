# Maintainer: Carl George < arch at cgtx dot us >

_name="apache-libcloud"
_module="${_name#apache-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.18.0"
pkgrel="1"
pkgdesc="A standard Python library that abstracts away differences among multiple cloud provider APIs."
arch=("any")
url="https://libcloud.apache.org"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.bz2")
sha256sums=('af87e9ccd5577f7a7cf8b0f642889c40738561eb7ab2f23039c0d3d648b80d2a')

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
