# Maintainer: googol <googol@posteo.de>
# Former maintainer: Oliver Mangold <o.mangold at gmail dot com>
pkgname=python-alembic
pkgver=0.8.4
pkgrel=1
pkgdesc="Alembic is a lightweight database migration tool for usage with the SQLAlchemy Database Toolkit for Python 3."
arch=('any')
url='https://bitbucket.org/zzzeek/alembic'
license=('MIT')
depends=('python' 'python-mako' 'python-sqlalchemy' 'python-editor')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/a/alembic/alembic-${pkgver}.tar.gz
        https://pypi.python.org/packages/source/a/alembic/alembic-${pkgver}.tar.gz.asc)
sha256sums=('8507fc12ccc99321da2fa117dde4b5d8664ff5ef017df7ce5e7e5051901a624a'
            'SKIP')
# Developers key: https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/python-sqlalchemy
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')

build() {
  cd "${srcdir}/alembic-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/alembic-${pkgver}"
  python setup.py install --root "${pkgdir}"
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${srcdir}/alembic-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
