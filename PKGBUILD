# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-alembic-1.4.1
pkgver=1.4.1
pkgrel=1
pkgdesc='Lightweight database migration tool for usage with SQLAlchemy'
url='https://bitbucket.org/zzzeek/alembic'
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-mako' 'python-sqlalchemy' 'python-editor' 'python-dateutil')
checkdepends=('python-pytest' 'python-mock')
conflicts=('python-alembic')
provides=('python-alembic=1.4.1')
source=(https://pypi.org/packages/source/a/alembic/alembic-${pkgver}.tar.gz)
sha512sums=('a3333c83533e8bba5fb41a1bf438806728db9597071da2afa8e8e4f246d7d5b13d081d1df7d4e8cd17a67ba2a62900808c324e2f27de7d556f9afebea5cb6ecb')

build() {
  echo 'Building python...'
  (cd alembic-${pkgver}
    python setup.py build
  )
}

package() {
  depends=('python' 'python-mako' 'python-sqlalchemy' 'python-editor' 'python-dateutil')
  cd alembic-${pkgver}
  python setup.py install --root="${pkgdir}" --prefix=/usr -O1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
