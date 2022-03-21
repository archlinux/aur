# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-nspektr
_pkgname=${pkgname:7}
pkgver=0.3.0
pkgrel=1
pkgdesc="package inspector"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('5a573d6e71bcde268576651524e24fdfaafbbf0b6a927d64b596d3a43967c1cf')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
