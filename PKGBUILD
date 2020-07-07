# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
pkgname=python-flask-limiter
pkgver=1.3.1
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-six' 'python-limits')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-limiter/Flask-Limiter-${pkgver}.tar.gz")

sha256sums=('08d6d7534a847c532fd36d0df978f93908d8616813085941c862bbcfcf6811aa')

build() {
    cd "${srcdir}/Flask-Limiter-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/Flask-Limiter-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
