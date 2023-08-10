# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fredapi
_pkgname=${pkgname:7}
pkgver=0.5.1
pkgrel=1
pkgdesc="Python API for Federal Reserve Economic Data (FRED) from St. Louis Fed"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python python-pandas)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('fe6e2320641ea6b516de8f2dbef8affd2a55f30efb189846a5c19078738ef162')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
