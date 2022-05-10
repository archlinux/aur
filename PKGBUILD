# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fundamentalanalysis
_pkgname=fundamentalanalysis
pkgver=0.2.14
pkgrel=1
pkgdesc="Fully-fledged Fundamental Analysis package"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-pandas)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('bc3ee7948f7de817e195b2ac6d34dc6ba9c5f4780c9d29b7768c2790e67ab4a4')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
