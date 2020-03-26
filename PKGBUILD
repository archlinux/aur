# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-skia-pathops'
_pkgname='skia-pathops'
pkgver='0.3.0'
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
sha256sums=('9d5ad3d0e7be0e6ba542ad769a8149f97bf0d431520167840ad3fc4472d16585')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    python setup.py build_ext --inplace
    PYTHONPATH="src/python" pytest
}
