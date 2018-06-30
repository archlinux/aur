# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-daphne
_pypi_pkgname=daphne
pkgver=2.2.0
pkgrel=1
pkgdesc="HTTP, HTTP2 and WebSocket protocol server for ASGI, and developed to power Django Channels"
arch=(any)
url="https://github.com/django/daphne"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django-channels' 'python-asgiref' 'python-twisted' 'python-autobahn')
optdepends=('python-asgi-ipc' 'python-django-channels-redis')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('5b28ce1c5bf44ec3c13109bb8783e39e3e90d7384fd3dad4bb773425dd439d84')

build() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
