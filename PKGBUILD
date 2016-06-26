# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=socketIO_client
pkgname=python-socketio-client
pkgver=0.6.6
pkgrel=1
pkgdesc="Here is a socket.io client library for Python. You can use it to write test code for your socket.io server."
arch=('any')
url="https://github.com/invisibleroads/socketIO-client"
license=('MIT')
depends=('python>=3.4' 'python-requests>=2.7.0' 'python-six' 'python-websocket-client')
makedepends=('python-setuptools')
provides=('python-socketio-client')
source=("https://files.pythonhosted.org/packages/99/45/df4c33f860c6683ff8664b86ae6aff0216b2e0f96f645d0684e22862a450/socketIO_client-0.6.6.tar.gz" "LICENSE")
md5sums=('39a7ffa50b5f03aea12b4cc9b3c282a8'
         'd254476822e464804f51bea272ee2588')

package() {
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
