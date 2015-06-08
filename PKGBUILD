# Maintainer: Carl George < arch at cgtx dot us >

_name="warlock"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.1.0"
pkgrel="3"
pkgdesc="Python object model built on JSON schema and JSON patch."
arch=("any")
url="https://github.com/bcwaldon/warlock"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bbfb4279034ccc402723e38d2a2e67cd619988bf4802fda7ba3e8fab15762651')

package_python-warlock() {
    depends=("python-jsonschema>=0.7"
             "python-jsonpatch>=0.10"
             "python-six")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-warlock() {
    depends=("python2-jsonschema>=0.7"
             "python2-jsonpatch>=0.10"
             "python2-six")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
