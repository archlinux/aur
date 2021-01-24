pkgbase='python-djangorestframework-csv'
pkgname=('python-djangorestframework-csv')
_module='djangorestframework-csv'
pkgver='2.1.0'
pkgrel=1
pkgdesc="CSV Tools for Django REST Framework"
url="https://github.com/mjumbewu/django-rest-framework-csv"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2f008b20a44f2d3c37835ea5b5ddfe19f54394f07b9cb267c616a917a7f7e27c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
