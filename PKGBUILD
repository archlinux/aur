# Maintainer: Carl George < arch at cgtx dot us >

_name="oslo.serialization"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.7.0"
pkgrel="1"
pkgdesc="Oslo Serialization library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('164f32e9ba3ea95530fcfa6367d0d57bc0840834050123496b979fdd703f6412')

package_python-oslo-serialization() {
    depends=("python-babel>=1.3"
             "python-six>=1.9.0"
             "python-msgpack>=0.4.0"
             "python-iso8601>=0.1.9"
             "python-oslo-utils>=1.6.0"
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
             "python2-oslo-utils>=1.6.0"
             "python2-pbr>=0.11"
             "python2-pytz>=2013.6")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
