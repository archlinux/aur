# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiopg
pkgver=0.13.0
pkgrel=1
pkgdesc="PostgreSQL driver for asyncio"
arch=(any)
url="http://aiopg.readthedocs.org/"
license=('MIT')
depends=('python-psycopg2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/aiopg/aiopg-$pkgver.tar.gz")

build() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('04792e88cf144df94e5f55e0f9fd653b459d4c28dfdaa5bc4a5c5992067cb828')
