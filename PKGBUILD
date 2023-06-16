# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-swagger-ui-py"
pkgver=22.07.13
pkgrel=1
pkgdesc="Swagger UI for Python web framework, such Tornado, Flask and Sanic"
url="https://pwzer.github.io/swagger-ui-py/"
license=("APACHE2")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/PWZER/swagger-ui-py/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db8e0759f477b292258c89482de487b9fc2ea6da4cf0af00c2a2995346967f13')
options=("!strip")

build(){
 cd "${pkgname/python-/}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${pkgname/python-/}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
