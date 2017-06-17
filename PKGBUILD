# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-daphne
_pypi_pkgname=daphne
pkgver=1.3.0
pkgrel=1
pkgdesc="HTTP, HTTP2 and WebSocket protocol server for ASGI, and developed to power Django Channels"
arch=(any)
url="https://github.com/django/daphne"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-asgiref' 'python-twisted' 'python-autobahn')
optdepends=('python-asgi-ipc' 'python-asgi-redis')
source=("https://pypi.io/packages/source/d/daphne/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('70f7f112d0a0047ed9db9ace42782caf')

build() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
