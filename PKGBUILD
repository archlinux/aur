# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-python-dateutil
_pkgname=${pkgname:7}
pkgver=2.8.19.8
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://github.com/python/typeshed"
license=(Apache)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('316c6b107d055bbd06324b71362e6104102220e6988aa4a388550aa3a8ad5d06')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

