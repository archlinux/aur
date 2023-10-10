# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-financedatabase
_pkgname=${pkgname:7}
pkgver=2.2.0
pkgrel=1
pkgdesc="Database of 300.000+ symbols containing Equities"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(
    python
    python-pandas
    python-tablib
    python-matplotlib
    python-dill
    python-tqdm
    python-requests
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('5e62648ba507e0ba2301328195439df1a30afffea9da6fca582fac5af30daf61')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
