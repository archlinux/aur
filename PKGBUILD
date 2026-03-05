# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-secure
_name=secure
pkgver=1.0.1
pkgrel=2
pkgdesc="A small, focused library for adding modern security headers to Python web applications"
url="https://github.com/TypeError/secure.py"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8c998dfb5afc954a63dcc214bdb1fc2f990385e775babf346d4fc11553e2f9bc')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
