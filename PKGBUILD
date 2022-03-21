# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-financedatabase
_pkgname=${pkgname:7}
pkgver=1.0.2
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
sha256sums=('7b03d37ef5eef8433380d92122f2fd24bad741971518eaf1bd4a9c6f30763e23')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
