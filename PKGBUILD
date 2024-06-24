# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-deltachat2
_pkgname=deltachat2
pkgver=0.6.2
pkgrel=2
pkgdesc="Delta Chat client library for Python"
url="https://pypi.org/project/deltachat2/"
depends=(python)
license=('MPL-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/5e/3d/649e83759ce6ab72913a7688d6ab7a12c8f3041597daf95972e03a91e45f/${_pkgname}-${pkgver}.tar.gz")
makedepends=('python-setuptools-scm>=8' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
sha256sums=('82cbc30684f5c673bf5786326a79c817831df9f21cb0ce665eeeb6f79655013a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
