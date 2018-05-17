# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiopg
pkgver=0.14.0
pkgrel=1
pkgdesc="PostgreSQL driver for asyncio"
arch=(any)
url="http://aiopg.readthedocs.org/"
license=('MIT')
depends=('python-psycopg2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/aiopg/aiopg-$pkgver.tar.gz")
sha256sums=('7dee52e0fa4697bace62d39180df96e94a328ee96aa211c8e93c346b8ffd1bcc')

build() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
