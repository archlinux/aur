# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-pyyaml
_pkgname=types-PyYAML
pkgver=6.0.12.20240311
pkgrel=1
pkgdesc="Typing stubs for PyYAML"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a9e0f0f88dc835739b0c1ca51ee90d04ca2a897a71af79de9aec5f38cb0a5342')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
