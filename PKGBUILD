# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-rollbar
pkgver=0.13.9
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

sha256sums=('f23f6b62496e2492f15a6bd1783dadfbbc784969210aa29bac08db1e242ceb95')
