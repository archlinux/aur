# Maintainer: googol <googol@posteo.de>
# Former maintainer: Oliver Mangold <o.mangold at gmail dot com>
pkgname=python-alembic
pkgver=0.9.1
pkgrel=2
pkgdesc="Alembic is a lightweight database migration tool for usage with the SQLAlchemy Database Toolkit for Python 3."
arch=('any')
url='https://bitbucket.org/zzzeek/alembic'
license=('MIT')
depends=('python' 'python-mako' 'python-sqlalchemy' 'python-editor')
makedepends=('python-setuptools')
source=(https://pypi.io/packages/source/a/alembic/alembic-${pkgver}.tar.gz
        https://pypi.io/packages/source/a/alembic/alembic-${pkgver}.tar.gz.asc)

sha256sums=('767cf6c8c4578f1f625f17bfbc8716a7d4f80a0c1efc7a9b72af30ad68954962'
            'SKIP')
# Developers key: https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/python-sqlalchemy
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')

build() {
  cd "${srcdir}/alembic-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/alembic-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${srcdir}/alembic-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
