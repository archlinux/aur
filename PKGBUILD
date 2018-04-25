# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiomysql
pkgver=0.0.14
pkgrel=1
pkgdesc="MySQL driver for asyncio"
arch=(any)
url="http://aiomysql.readthedocs.org/"
license=('MIT')
depends=('python-pymysql')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/aiomysql/aiomysql-$pkgver.tar.gz")

build() {
    cd "$srcdir"/aiomysql-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiomysql-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('e89cf3308db1212167996d54bcb0f9b0ecdbf7d303c6bf8c7a2554174645faa8')
