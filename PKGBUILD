# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-swagger-ui-py"
_name=${pkgname#python-}
pkgver=25.7.1
pkgrel=2
pkgdesc="Swagger UI for Python web framework, such Tornado, Flask and Sanic"
url="https://pwzer.github.io/swagger-ui-py/"
license=("APACHE2")
arch=("any")
depends=("python" "python-jinja" "python-packaging" "python-yaml")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://github.com/PWZER/swagger-ui-py/releases/download/v$pkgver/swagger-ui-py-$pkgver.tar.gz")
b2sums=('f72fdde83d45f8afeba2f62fe26a1c0c3064dae6968de8695352aade7d9e50bd1c380e44f6654fa2b72d389bd8e93dc5058010a8cafe8e85fefb4ef41f3de1d2')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 rm -rf $pkgdir/usr/lib/python*/site-packages/test
}
