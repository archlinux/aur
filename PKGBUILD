# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="oslo.utils"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.4.0"
pkgrel="1"
pkgdesc="Oslo Utility library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.4" "python2-pbr>=1.4")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('fe210740eca9ef168afbb98038b94e48e3beb17f48b8a771f044a5fbfc7d0397')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/pbr/d' requirements.txt
}

package_python-oslo-utils() {
    depends=("python-babel>=1.3"
             "python-debtcollector>=0.3.0"
             "python-iso8601>=0.1.9"
             "python-monotonic>=0.3"
             "python-netaddr>=0.7.12"
             "python-netifaces>=0.10.4"
             "python-oslo-i18n>=1.5.0"
             "python-pytz>=2013.6"
             "python-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-oslo-utils() {
    depends=("python2-babel>=1.3"
             "python2-debtcollector>=0.3.0"
             "python2-iso8601>=0.1.9"
             "python2-monotonic>=0.3"
             "python2-netaddr>=0.7.12"
             "python2-netifaces>=0.10.4"
             "python2-oslo-i18n>=1.5.0"
             "python2-pytz>=2013.6"
             "python2-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
