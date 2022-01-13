# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname='python-django-formtools'
pkgver=2.3
pkgrel=1
pkgdesc='A set of high-level abstractions for Django forms'
arch=('any')
url="https://github.com/jazzband/django-formtools"
license=('BSD')
depends=('python-django')
makedepends=('python-setuptools' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d8de6021882022b3f77b444ae31fe7616277f71f05f130d2e6a88d6c8d1ec1d2')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
    cd "$srcdir/django-formtools-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/django-formtools-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
