# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-sqlalchemy-1.3.13
pkgver=1.3.13
pkgrel=1
arch=('any')
url="https://www.sqlalchemy.org/"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-xdist' 'python-mock')
provides=('python-sqlalchemy=1.3.13')
conflicts=('python-sqlalchemy')
source=("https://pypi.io/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz")
sha512sums=('43ed4fe3505dab775996dc4b01ea729069dee3969f72188f130a942212252d97acb721e51e1a974a2756fdd62b8bf2c626a33f6913d585f669154212da3b783a')

build() {
  cd "$srcdir"/SQLAlchemy-$pkgver
  python setup.py build
}

package() {
  pkgdesc='Python SQL toolkit and Object Relational Mapper'
  depends=('python')
  optdepends=('python-psycopg2: connect to PostgreSQL database')

  cd SQLAlchemy-$pkgver
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
