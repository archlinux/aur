# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-swagger-ui-py"
_name=${pkgname#python-}
pkgver=23.9.23
pkgrel=2
pkgdesc="Swagger UI for Python web framework, such Tornado, Flask and Sanic"
url="https://pwzer.github.io/swagger-ui-py/"
license=("APACHE2")
arch=("any")
depends=("python" "python-jinja" "python-packaging" "python-yaml")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('723bd92cdd8f447e6d9dc44fe31b6343ab1e2bef7863691187a0086e6cbf58df4d909b483a8fb577fd565ba96c09ed7dd957301e1c301b0b549c636434cca525')
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
