# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fredapi
_pkgname=${pkgname:7}
pkgver=0.5.0
pkgrel=1
pkgdesc="Python API for Federal Reserve Economic Data (FRED) from St. Louis Fed"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python python-pandas)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('7e15a9b582b5dca67404f0807e351f8e638aa62057398e3654608ac5b021f782')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
