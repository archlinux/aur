# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="oslo.i18n"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.5.0"
pkgrel="1"
pkgdesc="Oslo i18n library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.4" "python2-pbr>=1.4")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9c11a8929da983bd37757168e4ea69f9b374923c5175b8401f31d3467115e7cd')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/pbr/d' requirements.txt
}

package_python-oslo-i18n() {
    depends=("python-babel>=1.3" "python-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-oslo-i18n() {
    depends=("python2-babel>=1.3" "python2-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
