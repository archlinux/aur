# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgbase='python-flask-api'
pkgname=('python-flask-api')
_module='Flask-API'
pkgver='2.0'
pkgrel=1
pkgdesc="Browsable web APIs for Flask."
url="https://github.com/flask-api/flask-api"
depends=('python' 'python-flask' 'python-markdown')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6986642e5b25b7def710ca9489ed2b88c94006bfc06eca01c78da7cf447e66e5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
