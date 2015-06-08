# Maintainer: Carl George < arch at cgtx dot us >

_name="traceback2"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.4.0"
pkgrel="1"
pkgdesc="Backports of the traceback module"
arch=("any")
url="https://github.com/testing-cabal/${_module}"
license=("Python")
makedepends=("python-pbr" "python2-pbr")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030')

package_python-traceback2() {
    depends=("python-pbr>=0.11"
             "python-linecache2"
             "python-six")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-traceback2() {
    depends=("python2-pbr>=0.11"
             "python2-linecache2"
             "python2-six")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
