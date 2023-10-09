# Maintainer: Zhang.j.k <zhangjk67 at gmail dot com>

pkgbase='python-drf-yasg'
pkgname=('python-drf-yasg')
_module='drf-yasg'
pkgver='1.21.5'
pkgrel=1
pkgdesc="Automated generation of real Swagger/OpenAPI 2.0 schemas from Django Rest Framework code."
url="https://github.com/axnsan12/drf-yasg"
depends=('python' 'python-django' 'python-coreapi' 'python-coreschema' 'python-inflection' 'python-uritemplate' 'python-packaging' 'python-django-rest-framework' 'python-setuptools')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ceef0c3b5dc4389781afd786e6dc3697af2a2fe0d8724ee1f637c23d75bbc5b2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
