# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-temporal-cache
_pkgname=${pkgname:7}
pkgver=0.1.4
pkgrel=1
pkgdesc="Time based function caching"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python python-frozendict python-tzlocal)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('b6dd850359c46bd4a5c59fc3b953f8924e429b1179a351b3508d07c214738b50')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
