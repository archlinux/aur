# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-hijri-converter
_pkgname=${pkgname:7}
pkgver=2.2.3
pkgrel=1
pkgdesc="Accurate Hijri-Gregorian dates converter based on the Umm al-Qura calendar"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('e7149cececca647bf40689ec89bf593c7252b31d699ea587ad0bce91ba42d382')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
