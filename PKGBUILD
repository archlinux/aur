# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-socketio-client-nexus
_pkgname=socketIO-client-nexus
pkgver=0.7.6
pkgrel=1
pkgdesc="A socket.io client library"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-six python-websocket-client)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('41e6aaaff981f6729690f472eb2c7a5d1dda07349077e34444527b9700b0aea5')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
