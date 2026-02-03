# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-swagger-ui-py"
_name=${pkgname#python-}
pkgver=25.7.1
pkgrel=1
pkgdesc="Swagger UI for Python web framework, such Tornado, Flask and Sanic"
url="https://pwzer.github.io/swagger-ui-py/"
license=("APACHE2")
arch=("any")
depends=("python" "python-jinja" "python-packaging" "python-yaml")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://github.com/PWZER/swagger-ui-py/releases/download/v$pkgver/swagger_ui_py-$pkgver-py3-none-any.whl")
b2sums=('8298c0d15c610f75bb7d4c98889bf57e1872e2e8aac953c6126d1d2c270290df19e283fde8547f7a5a0325f81163c932331d97f8cfbf3c451c994568637cb577')
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
