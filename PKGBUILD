# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-skia-pathops'
_pkgname='skia-pathops'
pkgver='0.4.0'
pkgrel=1
pkgdesc="Python bindings for the Skia library's Path Ops."
url="https://github.com/fonttools/skia-pathops"
checkdepends=('python-pytest' 'python-pytest-cython')
depends=('python')
makedepends=('cython' 'python-setuptools')
optdepends=()
license=('BSD')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('cef6a6a263c8fa8f1149be7888ec41db1fa927caec6e7db5845c5e8560347987')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    python setup.py build_ext --inplace
    PYTHONPATH="src/python" pytest
}
