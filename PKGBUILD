# Maintainer:  Anton Kudelin <kudelin at proton dot me>


pkgname=python-flask-appbuilder
_name=${pkgname#python-}
pkgver=5.3.1
pkgrel=1
arch=(any)
pkgdesc="Simple and rapid application development framework, built on top of Flask"
url="https://github.com/dpgaspar/Flask-AppBuilder"
license=("BSD")
depends=(
        "python"
        "python-apispec"
        "python-colorama"
        "python-click"
        "python-email-validator"
        "python-flask"
        "python-flask-babel"
        "python-flask-limiter"
        "python-flask-login"
        "python-flask-sqlalchemy"
        "python-flask-wtf"
        "python-flask-jwt-extended"
        "python-jsonschema"
        "python-marshmallow"
        "python-marshmallow-sqlalchemy"
        "python-dateutil"
        "python-prison"
        "python-pyjwt"
        "python-sqlalchemy"
        "python-sqlalchemy-utils"
        "python-wtforms"
        "python-werkzeug"
        "python-jmespath"
        "python-authlib"
        "python-flask-openid"
        "python-flask-talisman"
)
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('53729f58faede1337ead4041a939429f5695ed255924b534e1f7c23030ab6b71b283156f764f9cfa66ec59cf5091c4fdd616d044ffc6fea17306cb6978c2d9fa')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
