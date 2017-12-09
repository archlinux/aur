# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgiref
_pypi_pkgname=asgiref
pkgver=1.1.2
pkgrel=2
pkgdesc="Reference ASGI adapters and channel layers"
arch=(any)
url=" http://github.com/django/asgiref/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('323b849cb9a73f770ed96f3d5d46e43b')

build() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
