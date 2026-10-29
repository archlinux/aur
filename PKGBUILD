# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-flask-openid"
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=2
pkgdesc="OpenID support for Flask"
arch=(any)
url="https://github.com/pallets-eco/flask-openid"
license=("BSD-3")
depends=("python-flask" "python-werkzeug" "python-openid")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('545339e3a29b88bbb2db4a07196368e778c0d0fcdb032a17d015df2c6dda7b0cd55e187f462a28aa0c69243fa9d3f3cb7fd0eb41274bcff2b86fa42380ffc6a7')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
