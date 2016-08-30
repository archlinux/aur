# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pymysql
pkgver=0.7.7
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="http://www.pymysql.org/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/PyMySQL/PyMySQL-$pkgver.tar.gz")

build() {
    cd "$srcdir/PyMySQL-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/PyMySQL-$pkgver"
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('0d8edc5817fa07eb34fd249b5042d0c6d972cf4e01525258d1123532e52a4f0c')
