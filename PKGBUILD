# Maintainer: jakob <grandchild@gmx.net>

_pkgname=flask-restx
pkgname=python-${_pkgname}
pkgver=1.1.0
pkgrel=1
pkgdesc="Flask extension that adds support for quickly building REST APIs"
arch=('any')
url="https://flask-restx.readthedocs.io/"
license=('BSD')
depends=(python python-{flask\>=0.8,aniso8601\>=0.82,jsonschema,pytz,werkzeug})
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('62b6b6c9de65e5960cf4f8b35e1bd3eca6998838a01b2f71e2a9d4c14a4ccd14')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
