# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-drf-yasg'
pkgname=('python-drf-yasg')
_module='drf-yasg'
pkgver='1.21.3'
pkgrel=4
pkgdesc="Automated generation of real Swagger/OpenAPI 2.0 schemas from Django Rest Framework code."
url="https://github.com/axnsan12/drf-yasg"
depends=('python' 'python-django' 'python-coreapi' 'python-coreschema' 'python-inflection' 'python-uritemplate' 'python-packaging' 'python-django-rest-framework')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b2eebb438fa641503a08dac791be24183ea26dbcfe371a9824ea91f6e3a988aa')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
