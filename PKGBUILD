# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiopg
pkgver=0.10.0
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

sha256sums=('b540f8fbfcb53f9c5cc9a6b49f0fd0311eae0c076e324a4b5928ab653c5a7b3d')
