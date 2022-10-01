# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-hijri-converter
_pkgname=${pkgname:7}
pkgver=2.2.4
pkgrel=2
pkgdesc="Accurate Hijri-Gregorian dates converter based on the Umm al-Qura calendar"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('9e1d9fa4c220f6867da2abb1a96240675ae974abba951c686a781f4ef6ac218f')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
