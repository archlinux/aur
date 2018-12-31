# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiomysql
pkgver=0.0.20
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

sha256sums=('d89ce25d44dadb43cf2d9e4603bd67b7a0ad12d5e67208de013629ba648df2ba')
