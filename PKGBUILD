# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-raven
pkgver=5.7.2
pkgrel=1
pkgdesc="Python client for Sentry"
arch=(any)
url="https://github.com/getsentry/raven-python"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/r/raven/raven-$pkgver.tar.gz")

build() {
    cd "$srcdir/raven-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/raven-$pkgver"
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('6ee351577bff691a064d093dfbf54a064a8f1d6e136602c5c45780f8a340b3aa')
