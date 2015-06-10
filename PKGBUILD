# Contributor: Marti Raudsepp <marti@juffo.org>
pkgname=python2-txpostgres
pkgver=1.4.0
pkgrel=1
pkgdesc='An asynchronous PostgreSQL driver for the Twisted framework, based on psycopg2'
arch=('any')
url="https://github.com/wulczer/txpostgres"
license=('MIT')
makedepends=('python2-distribute')
depends=('twisted')
optdepends=('python2-psycopg2: psycopg2 backend'
            'python2-psycopg2ct: psycopg2-ctypes backend')
source=("http://pypi.python.org/packages/source/t/txpostgres/txpostgres-$pkgver.tar.bz2")
sha256sums=('5f6833c4be4a75bd3c51a4b917f4745ec78799a88e6552a077beaafdef87b553')

package() {
  cd "$srcdir/txpostgres-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
