# Maintainer: Carl George < arch at cgtx dot us >

_name="testtools"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.8.0"
pkgrel="3"
pkgdesc="Extensions to the Python standard library unit testing framework"
arch=("any")
url="https://github.com/testing-cabal/testtools"
license=("MIT")
makedepends=("python-pbr" "python2-pbr")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8afd6400fb4e75adb0b29bd09695ecb2024cd7befab4677a58c147701afadd97')

package_python-testtools() {
    depends=("python-pbr>=0.11"
             "python-extras"
             "python-mimeparse"
             "python-unittest2>=1.0.0"
             "python-traceback2")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-testtools() {
    depends=("python2-pbr>=0.11"
             "python2-extras"
             "python2-mimeparse"
             "python2-unittest2>=1.0.0"
             "python2-traceback2")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
