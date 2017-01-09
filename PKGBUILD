# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=socketIO-client
pkgname=python-socketio-client
pkgver=0.7.2
pkgrel=1
pkgdesc="A socket.io client library for Python. You can use it to write test code for your socket.io server."
arch=('any')
url="https://pypi.python.org/pypi/socketIO-client"
license=('MIT')
depends=('python>=3.4' 'python-requests>=2.7.0' 'python-six' 'python-websocket-client')
makedepends=('python-setuptools')
provides=('python-socketio-client')
source=("https://pypi.io/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz" "LICENSE")
md5sums=('ecdbfa4cc00118d2948632cd50b10735'
         'd254476822e464804f51bea272ee2588')

package() {
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
