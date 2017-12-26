# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=python-mixer
pkgver=6.0.0
pkgdesc="Mixer -- Is a fixtures replacement. Supported Django, Flask, SqlAlchemy and custom python objects."
pkgrel=1
arch=('any')
license=('BSD-3')
url='https://github.com/klen/mixer'
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/klen/mixer/tar.gz/$pkgver)
sha256sums=('140fae4fa0b060d2b90a0e53b19db9c0d42fecd83f7059707a6f751d9c1e1328')
makedepends=('python-setuptools')
depends=(
    'python-faker'
)

optdepends=('python-django: Django ORM support'
            'python-flask-sqlalchemy: SQLAlchemy ORM support and integration as Flask application'
            'python-mongoengine: Mongoengine ODM support'
            'python-sqlalchemy: SQLAlchemy ORM support'
)

package() {
  cd "${srcdir}/mixer-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
