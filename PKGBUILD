# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-pyyaml
_pkgname=types-PyYAML
pkgver=6.0.5
pkgrel=1
pkgdesc="Typing stubs for PyYAML"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('464e050914f3d1d83a8c038e1cf46da5cb96b7cd02eaa096bcaa03675edd8a2e')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
