# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiopg
pkgver=0.9.2
pkgrel=1
pkgdesc="PostgreSQL driver for asyncio"
arch=(any)
url="http://aiopg.readthedocs.org/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/a/aiopg/aiopg-$pkgver.tar.gz")

build() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiopg-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('166c7f8ca40d49219ee815d8441ba720a7ddf44a3584354c83f52c028bd967ce')
