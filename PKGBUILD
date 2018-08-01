pkgbase=('python-flask-socketio2')
pkgname=('python-flask-socketio2')
_module='Flask-SocketIO'
pkgver='2.9.6'
pkgrel=1
pkgdesc="Socket.IO integration for Flask applications"
url="http://github.com/miguelgrinberg/Flask-SocketIO/"
depends=('python' 'python-flask12' 'python-socketio')
makedepends=('python-setuptools')
provides=('python-flask-socketio')
conflicts=('python-flask-socketio')
license=('MIT')
arch=('any')
source=("https://github.com/miguelgrinberg/Flask-SocketIO/archive/v2.9.6.tar.gz")
md5sums=('f40247625a03ea1136f64ec4bbc5cb3b')
build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
