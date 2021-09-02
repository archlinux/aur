# Maintainer: jakob <grandchild@gmx.net>

_pkgname=flask-restx
pkgname=python-${_pkgname}
pkgver=0.5.1
pkgrel=1
pkgdesc="Flask extension that adds support for quickly building REST APIs"
arch=('any')
url="https://flask-restx.readthedocs.io/"
license=('BSD')
depends=(python python-{flask\>=0.8,aniso8601\>=0.82,jsonschema,pytz,six\>=1.3.0})
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('63c69a61999a34f1774eaccc6fc8c7f504b1aad7d56a8ec672264e52d9ac05f4')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
