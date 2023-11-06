# Maintainer: Lex Black <autumn-wind@web.de>

_module=drf-spectacular
pkgname=python-$_module
pkgver=0.26.5
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
sha256sums=('aee55330a774ba8a9cbdb125714d1c9ee05a8aafd3ce3be8bfd26527649aeb44')


build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
