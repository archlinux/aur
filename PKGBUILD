# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=socketIO_client
pkgname=python-socketio-client
pkgver=0.6.5
pkgrel=1
pkgdesc="Here is a socket.io client library for Python. You can use it to write test code for your socket.io server."
arch=('any')
url="https://github.com/invisibleroads/socketIO-client"
license=('custom':'MIT')
depends=('python>=3.4' 'python-requests>=2.7.0' 'python-six' 'python-websocket-client')
makedepends=('python-setuptools')
provides=('python-socketio-client')
source=("https://pypi.python.org/packages/source/s/socketIO-client/$_name-$pkgver.tar.gz" "LICENSE")
md5sums=('febe2d6ab5839521c45fbd16c455d183'
         'd254476822e464804f51bea272ee2588')

package() {
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
