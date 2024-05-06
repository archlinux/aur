# Maintainer: Zhang.j.k <zhangjk67 at gmail dot com>

pkgbase='python-drf-yasg'
pkgname=('python-drf-yasg')
_module='drf-yasg'
pkgver='1.21.7'
pkgrel=2
pkgdesc="Automated generation of real Swagger/OpenAPI 2.0 schemas from Django Rest Framework code."
url="https://github.com/axnsan12/drf-yasg"
depends=('python' 'python-django' 'python-coreschema' 'python-inflection' 'python-uritemplate' 'python-packaging' 'python-django-rest-framework')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('4c3b93068b3dfca6969ab111155e4dd6f7b2d680b98778de8fd460b7837bdb0d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
