# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-drf-yasg'
pkgname=('python-drf-yasg')
_module='drf-yasg'
pkgver='1.20.0'
pkgrel=2
pkgdesc="Automated generation of real Swagger/OpenAPI 2.0 schemas from Django Rest Framework code."
url="https://github.com/axnsan12/drf-yasg"
depends=('python' 'python-django' 'python-coreapi' 'python-coreschema' 'python-inflection' 'python-uritemplate' 'python-packaging' 'python-djangorestframework')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d50f197c7f02545d0b736df88c6d5cf874f8fea2507ad85ad7de6ae5bf2d9e5a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
