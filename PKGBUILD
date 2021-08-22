# Maintainer: Roberto Anic Banic <nicba1010@gmail.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python2-storm
pkgver=0.25
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
source=(https://launchpad.net/storm/trunk/$pkgver/+download/storm-$pkgver.tar.gz)
sha256sums=('ec7cc8897638f94f6b75c6a2af74aa9b31f5492d7a2f9482c08a8dd7b46adb14')
sha512sums=('a30348646f9fb801ad521c6200e6c856ad6a177aca8fe00f861da535b1215af650e4ef8583fa9e06e67ab5ee064efbfa7a52bd5a82a0341230c0e2cd6143e0e6')

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
