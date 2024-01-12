# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=python-mixer
pkgver=7.2.2
pkgdesc="Mixer -- Is a fixtures replacement. Supported Django, Flask, SqlAlchemy and custom python objects."
pkgrel=1
arch=('any')
license=('BSD-3')
url='https://github.com/klen/mixer'
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/klen/mixer/tar.gz/$pkgver)
sha256sums=('bd0d73259308a5e8e031677bcc280a0a40b6e438f1fef13a9ad3b68279299e5a')
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
