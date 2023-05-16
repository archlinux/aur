# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgi-ipc
_pypi_pkgname=asgi_ipc
pkgver=1.4.2
pkgrel=5
pkgdesc="Posix IPC-backed ASGI channel layer implementation"
arch=(any)
url=" https://pypi.python.org/pypi/asgi_ipc"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-msgpack' 'python-asgiref')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('2403f41184405791b05e7aee570bd6ccd47e2d91845d78fe17adcf58ef48c037')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
