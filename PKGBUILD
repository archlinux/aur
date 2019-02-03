# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-daphne
_pypi_pkgname=daphne
pkgver=2.2.5
pkgrel=0
pkgdesc="HTTP, HTTP2 and WebSocket protocol server for ASGI, and developed to power Django Channels"
arch=(any)
url="https://github.com/django/daphne"
license=('BSD')
makedepends=('python-setuptools' 'python-pytest-runner')
depends=('python' 'python-django-channels' 'python-asgiref' 'python-twisted' 'python-autobahn')
optdepends=('python-asgi-ipc' 'python-django-channels-redis')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('07810599fb7df656192cf3deaaada078d876626e0d7243b7b80eca051921c1fc')

build() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
