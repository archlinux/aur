pkgname=python-flask-admin
_module='Flask-Admin'
pkgver='1.5.7'
pkgrel=1
pkgdesc="Simple and extensible admin interface framework for Flask"
url="https://github.com/flask-admin/flask-admin/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('145f59407d78319925e20f7c3021f60c71f0cacc98e916e52000845dc4c63621')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
