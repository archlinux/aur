# Maintainer: Lex Black <autumn-wind@web.de>

_module=drf-spectacular-sidecar
pkgname=python-$_module
pkgver=2023.11.1
pkgrel=1
pkgdesc="Serve self-contained distribution builds of Swagger UI and Redoc with Django"
arch=(any)
url="https://github.com/tfranzel/drf-spectacular-sidecar"
license=(BSD)
depends=(python-django)
makedepends=(python-setuptools)
source=(${_module}-${pkgver}.tar.gz::https://github.com/tfranzel/${_module}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('501b74f37c8a453fdedd0accada0eff79243f21eeccdd969a87d0f5a7b4802ca')


build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
