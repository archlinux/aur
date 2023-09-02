# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-financedatabase
_pkgname=${pkgname:7}
pkgver=2.1.1
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
sha256sums=('bf28ecf4026e01e1c1d939b29bf70dae0bbbd8f81880a7805f91f50f49006060')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
