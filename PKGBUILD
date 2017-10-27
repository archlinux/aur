# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-rollbar
pkgver=0.13.17
pkgrel=1
pkgdesc="Easy and powerful exception tracking with rollbar"
arch=(any)
url="https://rollbar.com/docs/notifier/pyrollbar/"
license=('MIT')
depends=('python-requests' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/rollbar/pyrollbar/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir"/pyrollbar-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/pyrollbar-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('6da30f0340f1e3c92fd25c60a13e7e0f2f5837244f017ef03c46b35c08289795')
