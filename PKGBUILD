# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-detecta
_pkgname=${pkgname:7}
pkgver=0.0.5
pkgrel=1
pkgdesc="Detect events in data"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('d2ea7d13dfbbc994d6ce385a7f8dc0a85fe675a8a8e712a64ec56e54c40603ed')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
