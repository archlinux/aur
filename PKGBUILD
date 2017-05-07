# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgi-ipc
_pypi_pkgname=asgi_ipc
pkgver=1.3.1
pkgrel=1
pkgdesc="Posix IPC-backed ASGI channel layer implementation"
arch=(any)
url=" https://pypi.python.org/pypi/asgi_ipc"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-msgpack' 'python-posix_ipc' 'python-asgiref')
source=("https://pypi.io/packages/source/a/asgi_ipc/asgi_ipc-${pkgver}.tar.gz")
md5sums=('c80e000ece3ecfe56fc6e6e2a0a029cb')

build() {
    cd "${srcdir}/asgi_ipc-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/asgi_ipc-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
