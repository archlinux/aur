# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fundamentalanalysis
_pkgname=fundamentalanalysis
pkgver=0.3.0
pkgrel=1
pkgdesc="Fully-fledged Fundamental Analysis package"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-pandas)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('74fa698e1d253318c3a926ce9fb40c51123baa4ed378cff2e9162e2b83f634e2')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
