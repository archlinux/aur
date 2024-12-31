# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ffn
_pkgname=${pkgname:7}
pkgver=1.1.1
pkgrel=1
pkgdesc="Financial functions for Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-setuptools python-oldest-supported-numpy)
depends=(
    python
    python-decorator
    python-matplotlib
    python-numpy
    python-pandas
    python-scikit-learn
    python-scipy
    python-tabulate
    python-packaging
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('adf2d6b17594628034ca85dc0b1d77e2346dba2835bdeb27cf73763b58183ae5')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
