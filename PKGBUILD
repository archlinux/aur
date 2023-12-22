# Maintainer: jakob <grandchild@gmx.net>

_pkgname=flask-restx
pkgname=python-${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc="Flask extension that adds support for quickly building REST APIs"
arch=('any')
url="https://flask-restx.readthedocs.io/"
license=('BSD')
depends=(python python-{flask\>=0.8,aniso8601\>=0.82,jsonschema,pytz,werkzeug})
makedepends=(python-{build,installer,wheel})
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4f3d3fa7b6191fcc715b18c201a12cd875176f92ba4acc61626ccfd571ee1728')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}