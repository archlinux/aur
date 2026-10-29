# Maintainer:  Anton Kudelin <kudelin at proton dot me>


pkgname=python-flask-appbuilder
_name=Flask-AppBuilder
pkgver=4.3.11
_sdist=flask_appbuilder
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/source/${_sdist::1}/${_sdist}/${_sdist}-${pkgver}.tar.gz")
b2sums=('de8bbe2b6f47104ccd2a2fba16c22292fff82cc8ac1d01fa45049ec2c70ae174ab8b96ac47e757aae19b50f2f1f5534e135323cb7a519ec419bdd11ffcc6721d')

build(){
 cd "${_sdist}-${pkgver}"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_sdist}-${pkgver}"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
