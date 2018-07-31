# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pymysql
pkgver=0.9.2
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/PyMySQL/PyMySQL"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/PyMySQL/PyMySQL-$pkgver.tar.gz")
sha256sums=('9ec760cbb251c158c19d6c88c17ca00a8632bac713890e465b2be01fdc30713f')

build() {
    cd "$srcdir/PyMySQL-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/PyMySQL-$pkgver"
    python2 setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
