# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pymysql
pkgver=0.9.0
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/PyMySQL/PyMySQL"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/PyMySQL/PyMySQL-$pkgver.tar.gz")
sha256sums=('8ee053bce47c97786ccf7d2e73e9063c214251cecef846b1219a9169f4f833eb')

build() {
    cd "$srcdir/PyMySQL-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/PyMySQL-$pkgver"
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
