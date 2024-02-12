# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-flask-openid"
_name=Flask-OpenID
pkgver=1.3.0
pkgrel=3
pkgdesc="OpenID support for Flask"
arch=(any)
url="https://github.com/pallets-eco/flask-openid"
license=("BSD-3")
depends=("python-flask" "python-werkzeug" "python-openid")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('c20d51ba42b4899bf5da6db604dc7609e7bcf67b6ee4dae29b99b3a8c7ad9cf8a68c7d547bdf011d2d750b0a5c9897a3c0d94bb419738f0c14b1e466f190f7b6')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
