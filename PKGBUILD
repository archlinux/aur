# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-papermill
_pkgname=${pkgname:7}
pkgver=2.4.0
pkgrel=1
pkgdesc="Parametrize and run Jupyter and nteract Notebooks"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
depends=(
    python
    python-ansiwrap
    python-click
    python-pyyaml
    jupyter-nbformat
    jupyter-nbclient
    python-tqdm
    python-requests
    python-entrypoints
    python-tenacity
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6f8f8a9b06b39677f207c09100c8d386bcf592f0cbbdda9f0f50e81445697627')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
