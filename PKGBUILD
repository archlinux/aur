# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-pyyaml
_pkgname=types-PyYAML
pkgver=6.0.12.12
pkgrel=1
pkgdesc="Typing stubs for PyYAML"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('334373d392fde0fdf95af5c3f1661885fa10c52167b14593eb856289e1855062')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
