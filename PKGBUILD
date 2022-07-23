# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-pyyaml
_pkgname=types-PyYAML
pkgver=6.0.10
pkgrel=1
pkgdesc="Typing stubs for PyYAML"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a1676caeb098096833fe2f1472e7ea8debf7663222964fa90545cfaafebf3385')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
