# Maintainer:  Anton Kudelin <kudelin at proton dot me>


pkgname=python-flask-appbuilder
_name=Flask-AppBuilder
pkgver=4.3.11
pkgrel=1
arch=(any)
pkgdesc="Simple and rapid application development framework, built on top of Flask"
url="https://github.com/dpgaspar/Flask-AppBuilder"
license=("BSD")
depends=(
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
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('0f2f72146cbf361eab7e8f5ec481444044b1d392a8e0194e58b03787500fc29391eb385ed21b26b159a1cd699acfe5a214a6e68cf3b11ea7521e47279a7cd4ca')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
