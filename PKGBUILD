# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-rollbar
pkgver=0.14.4
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

sha256sums=('a8ae5234e2dfaf6caa5566754af63747ac3c1bb0f31c553339040956f2996e4c')
