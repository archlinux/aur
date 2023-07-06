# Maintainer: Lex Black <autumn-wind@web.de>

_module=drf-spectacular-sidecar
pkgname=python-$_module
pkgver=2023.7.1
pkgrel=1
pkgdesc="Serve self-contained distribution builds of Swagger UI and Redoc with Django"
arch=(any)
url="https://github.com/tfranzel/drf-spectacular-sidecar"
license=(BSD)
depends=(python-django)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
sha256sums=('fae346a00636a57aa164d2778e7162cfaff1f59af8133c2b6a8403c8211a167b')


build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
