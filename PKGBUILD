# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
pkgname=python-flask-limiter
pkgver=1.2.1
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-six' 'python-limits')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-limiter/Flask-Limiter-${pkgver}.tar.gz")

sha256sums=('d984a57ef37acb6eee29edc864ff22cd4cf090845f06968c015093ffd91e96f1')

build() {
    cd "${srcdir}/Flask-Limiter-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/Flask-Limiter-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
