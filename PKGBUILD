# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pymysql
pkgver=0.6.3
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

sha256sums=('07c6f082597cb7e048f3d96646334a17dd0ed263e080f9cc2c0762bb04cd6b35')
