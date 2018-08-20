# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiopg
pkgver=0.15.0
pkgrel=1
pkgdesc="PostgreSQL driver for asyncio"
arch=(any)
url="http://aiopg.readthedocs.org/"
license=('MIT')
depends=('python-psycopg2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/aiopg/aiopg-$pkgver.tar.gz")
sha256sums=('2fa57bee0b7b8422408a79de085c3423e0b0633be3a0046b66a53594bf69a837')

build() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
