# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiomysql
pkgver=0.1.0
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

sha256sums=('ef04453a3a3ecbd670f813e09d3944d15845b572b34caef3ff715c0140e1ae21')
