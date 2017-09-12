# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiopg
pkgver=0.13.1
pkgrel=1
pkgdesc="PostgreSQL driver for asyncio"
arch=(any)
url="http://aiopg.readthedocs.org/"
license=('MIT')
depends=('python-psycopg2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/aiopg/aiopg-$pkgver.tar.gz")
sha256sums=('7b4c96dc9f5599c5e29706004f3922fc541312eaf1190f97cb765343a5f9c372')

build() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
