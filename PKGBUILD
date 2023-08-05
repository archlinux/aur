# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname='python-django-formtools'
pkgver=2.4.1
pkgrel=1
pkgdesc='A set of high-level abstractions for Django forms'
arch=('any')
url="https://github.com/jazzband/django-formtools"
license=('BSD')
depends=('python-django')
makedepends=('python-setuptools' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('97a2fccc43b1667121750dedc48b876056253372c953104143fb8078af880ad1')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
    cd "$srcdir/django-formtools-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/django-formtools-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
