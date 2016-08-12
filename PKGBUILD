# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=socketIO-client
pkgname=python-socketio-client
pkgver=0.7.0
pkgrel=1
pkgdesc="Here is a socket.io client library for Python. You can use it to write test code for your socket.io server."
arch=('any')
url="https://pypi.python.org/pypi/socketIO-client"
license=('MIT')
depends=('python>=3.4' 'python-requests>=2.7.0' 'python-six' 'python-websocket-client')
makedepends=('python-setuptools')
provides=('python-socketio-client')
source=("https://pypi.python.org/packages/0c/99/e0c7a3677e9fcb520e729a05878630bb173b654a3114c4ad8aabe5df6a18/socketIO-client-0.7.0.tar.gz" "LICENSE")
md5sums=('f29c2a99671ca896041ee5a952e321ee'
         'd254476822e464804f51bea272ee2588')

package() {
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
