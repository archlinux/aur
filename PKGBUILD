# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgi-ipc
_pypi_pkgname=asgi_ipc
pkgver=1.4.1
pkgrel=1
pkgdesc="Posix IPC-backed ASGI channel layer implementation"
arch=(any)
url=" https://pypi.python.org/pypi/asgi_ipc"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-msgpack' 'python-posix_ipc' 'python-asgiref')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('e38a22bcbcdba56b2effa121c96a73f5')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
