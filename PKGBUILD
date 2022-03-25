# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pyportfolioopt
_pkgname=${pkgname:7}
pkgver=1.5.2
pkgrel=1
pkgdesc="Financial portfolio optimization in python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
depends=(
    python
    python-cvxopt
    python-cvxpy
    python-matplotlib
    python-numpy
    python-pandas
    python-scikit-learn
    python-scipy
    python-yfinance
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('afe65369ae14a48c40530779f1c42dda13ec6ef7ea2e0c5c43ee7795972de69a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
