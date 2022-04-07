# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pur
_pkgname=${pkgname:7}
pkgver=6.1.0
pkgrel=2
pkgdesc="Update packages in a requirements.txt file to latest versions."
arch=('any')
url="https://pypi.org/project/pur"
license=('BSD license')
makedepends=(python-build python-installer python-wheel)
depends=(python python-click)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('43de304474a8e6743d9b7a314d3303826c78d2bb46dd951c98c8fae3da9617af')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
