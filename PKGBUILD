# Maintainer: Lex Black <autumn-wind@web.de>

_module=djangorestframework-jsonapi
pkgname=python-django-rest-framework-json-api
pkgver=6.0.0
pkgrel=1
pkgdesc="JSON:API support for Django REST framework"
arch=(any)
url="https://github.com/django-json-api/django-rest-framework-json-api"
license=(BSD)
depends=(python-django python-django-rest-framework python-inflection)
makedepends=(python-setuptools)
optdepends=("python-django-polymorphic: polymorphic support"
            "python-django-filter: allow filtering"
            "python-yaml: for openapi support"
            "python-uritemplate: for openapi support")
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
sha256sums=('f2465b1b1cd3f372abacc8d99f82835643373f4f3f12965276ad1ccc2d110415')


build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
