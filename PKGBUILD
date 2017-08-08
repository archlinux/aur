pkgbase=('python-flask-socketio-git')
pkgname=('python-flask-socketio-git')
_module='Flask-SocketIO'
pkgver='2.9.2'
pkgrel=1
pkgdesc="Socket.IO integration for Flask applications"
url="http://github.com/miguelgrinberg/Flask-SocketIO/"
depends=('python' 'python-flask' 'python-socketio' 'python-engineio')
makedepends=('python-setuptools')
provides=('python-flask-socketio')
conflicts=('python-flask-socketio')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-socketio/Flask-SocketIO-${pkgver}.tar.gz")
md5sums=('1f8521101d2c9b4155cf521fbce3740c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
