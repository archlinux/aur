# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pymysql
pkgver=0.7.9
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/PyMySQL/PyMySQL"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/PyMySQL/PyMySQL-$pkgver.tar.gz")

build() {
    cd "$srcdir/PyMySQL-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/PyMySQL-$pkgver"
    python2 setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('2331f82b7b85d407c8d9d7a8d7901a6abbeb420533e5d5d64ded5009b5c6dcc3')
