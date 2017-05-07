# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-daphne
_pypi_pkgname=daphne
pkgver=1.2.0
pkgrel=1
pkgdesc="HTTP, HTTP2 and WebSocket protocol server for ASGI, and developed to power Django Channels"
arch=(any)
url="https://github.com/django/daphne"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-asgiref' 'python-twisted' 'python-autobahn')
optdepends=('python-asgi-ipc' 'python-asgi-redis')
source=("https://pypi.python.org/packages/c5/17/ceb2b30aeb406cae00ba4f3a573ad5f81cf15e374582a385c46f78640c37/daphne-1.2.0.tar.gz")
md5sums=('c07263cd57b46f8767dd63a7eb665913')

build() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/daphne-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
