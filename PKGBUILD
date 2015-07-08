# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python2-storm
pkgver=0.20
pkgrel=1
pkgdesc="Object-relational mapper (ORM) for Python developed at Canonical."
arch=(i686 x86_64)
url='http://storm.canonical.com/'
license=(LGPL)
depends=('python2')
makedepends=('python2-setuptools')
optdepends=("sqlite3: SQLite support"
            "mysql-python: MySQL support"
            "python2-psycopg2: PostgreSQL support"
            "python2-transaction: Zope support")
source=(http://launchpad.net/storm/trunk/$pkgver/+download/storm-$pkgver.tar.bz2)
md5sums=('a097945f3e8da19131ac19e1c45b5907')

build() {
  cd "$srcdir/storm-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/storm-$pkgver"
  python2 setup.py install --root="$pkgdir"
  install -D -m644 README "$pkgdir/usr/share/python2-storm/README"
  install -D -m644 NEWS "$pkgdir/usr/share/python2-storm/NEWS"
}
