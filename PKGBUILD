# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=invoke
pkgver=0.7.0
pkgrel=1
pkgdesc="Task execution tool & library"
url="http://pyinvoke.org"
license=('BSD')
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/i/invoke/invoke-$pkgver.tar.gz")

build() {
    cd "$srcdir/invoke-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/invoke-$pkgver"
    python2 setup.py install --skip-build -O1 --root="$pkgdir"

    install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('8c7e823663171c4b083a52c830b1195146fdee70dabd19a048eb4b219311af94')
