# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgbase='python-flask-api'
pkgname=('python-flask-api')
_module='Flask-API'
pkgver='1.1'
pkgrel=1
pkgdesc="Browsable web APIs for Flask."
url="https://github.com/flask-api/flask-api"
depends=('python' 'python-flask' 'python-markdown')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c0142c53fc4053d866ff3f449dd7f43b4737b6d9a70e5a77fa2b9aaf68bb4364')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
