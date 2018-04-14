# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgiref
_pypi_pkgname=asgiref
pkgver=2.3.0
pkgrel=0
pkgdesc="Reference ASGI adapters and channel layers"
arch=(any)
url=" http://github.com/django/asgiref/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('45233198d645be2bf2e9fa11517603f0')

build() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
