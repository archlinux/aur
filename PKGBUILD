# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('mailman3')
_pkgbase='mailman'
_commit=5bd0f593724f9a696bbefc91ea9c2127b66fa231
pkgver=3.0.0
pkgrel=1
pkgdesc="A mailing list management system"
arch=(any)
depends=('python' 'python-zope-interface' 'python-zope-event' 'python-zope-configuration'
         'python-zope-component' 'python-passlib' 'python-nose2' 'python-httplib2'
         'python-flufl-lock' 'python-flufl-i18n' 'python-flufl-bounce' 'python-falcon'
         'python-alembic' 'python-lazr-config' 'python-lazr-smtptest' 'python-mock'
         'python-sqlalchemy')
url="https://gitlab.com/mailman/mailman"
license=('LGPL')
options=(!emptydirs)
install=
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/mailman/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('0cc28e99bbe5a8e0638f9437d1fa8490fb69634cdef30324c7a5e63719581fc2')


package() {
  cd "$srcdir/$_pkgbase-$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
