# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pymysql
pkgver=0.6.6
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="http://www.pymysql.org/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/P/PyMySQL/PyMySQL-$pkgver.tar.gz")

build() {
    cd "$srcdir/PyMySQL-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/PyMySQL-$pkgver"
    python2 setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('c18e62ca481c5ada6c7bee1b81fc003d6ceae932c878db384cd36808010b3774')
