# Maintainer: Lex Black <autumn-wind@web.de>

_module=drf-spectacular
pkgname=python-$_module
pkgver=0.26.3
pkgrel=1
pkgdesc="Sane and flexible OpenAPI 3 schema generation for Django REST framework"
arch=(any)
url="https://github.com/tfranzel/drf-spectacular"
license=(BSD)
depends=(python-django
         python-django-rest-framework
         python-inflection
         python-jsonschema
         python-uritemplate
         python-yaml)
makedepends=(python-setuptools)
optdepends=("python-drf-spectacular-sidecar: offline and sidecar")
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
sha256sums=('b907a72a0244e5dcfeca625e9632cd8ebccdbe2cb528b7c1de1191708be6f31e')


build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
