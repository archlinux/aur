pkgbase=('python-flask-socketio-git')
pkgname=('python-flask-socketio-git')
_module='Flask-SocketIO'
pkgver='2.8.5'
pkgrel=1
pkgdesc="Socket.IO integration for Flask applications"
url="http://github.com/miguelgrinberg/Flask-SocketIO/"
depends=('python' 'python-flask' 'python-socketio' 'python-engineio')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-socketio/Flask-SocketIO-${pkgver}.tar.gz")
md5sums=('0b59cc04a3efb0dd6922d162b8bbf88e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
