# Maintainer: Carl George < arch at cgtx dot us >

_name="oslo.serialization"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.6.0"
pkgrel="1"
pkgdesc="Oslo Serialization library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e549ab5228f10dd13e6e1ea1f0dfe62af71de8d7df55665c37e2712ed7801595')

package_python-oslo-serialization() {
    depends=("python-babel>=1.3"
             "python-six>=1.9.0"
             "python-msgpack>=0.4.0"
             "python-iso8601>=0.1.9"
             "python-oslo-utils>=1.4.0"
             "python-pbr>=0.11"
             "python-pytz>=2013.6")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-oslo-serialization() {
    depends=("python2-babel>=1.3"
             "python2-six>=1.9.0"
             "python2-msgpack>=0.4.0"
             "python2-iso8601>=0.1.9"
             "python2-oslo-utils>=1.4.0"
             "python2-pbr>=0.11"
             "python2-pytz>=2013.6")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
