# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgiref
_pypi_pkgname=asgiref
pkgver=3.1.4
pkgrel=0
pkgdesc="Reference ASGI adapters and channel layers"
arch=(any)
url=" http://github.com/django/asgiref/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('865b7ccce5a6e815607b08d9059fe9c058cd75c77f896f5e0b74ff6c1ba81818')

build() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
