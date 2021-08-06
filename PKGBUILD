# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgbase='python-flask-api'
pkgname=('python-flask-api')
_module='Flask-API'
pkgver='3.0.post1'
pkgrel=1
pkgdesc="Browsable web APIs for Flask."
url="https://github.com/flask-api/flask-api"
depends=('python' 'python-flask' 'python-markdown')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('331889500433b0a5e71ae7910a00ee577c8999baba03ca685b3558ee93031cce')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
