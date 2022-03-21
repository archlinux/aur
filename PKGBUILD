# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-papermill
_pkgname=${pkgname:7}
pkgver=2.3.4
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
sha256sums=('be12d2728989c0ae17b42fcb05b623500004e94b34f56bd153355ccebb84a59a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
