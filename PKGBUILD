# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fundamentalanalysis
_pkgname=FundamentalAnalysis
pkgver=0.2.14
pkgrel=1
pkgdesc="Fully-fledged Fundamental Analysis package"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-pandas)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('360576a7e75cc576860a0de086cdd33522433932b90326830945b27c519051d3')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
