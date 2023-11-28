# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>
# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pytz-deprecation-shim
_pkgname=pytz_deprecation_shim
pkgver=0.1.0.post0
pkgrel=1
pkgdesc="Shims to make deprecation of pytz easier"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('af097bae1b616dde5c5744441e2ddc69e74dfdcb0c263129610d85b87445a59d')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
