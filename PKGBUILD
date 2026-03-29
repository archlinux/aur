# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-statici18n'
pkgver=2.7.1
pkgrel=1
pkgdesc='A Django app that provides helper for generating JavaScript catalog to static files'
arch=('any')
url='https://github.com/zyegfryed/django-statici18n'
license=('BSD')
depends=(
    'python-django'
    'python-django-appconf'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8d4c18205e9730c43175f526f77da8271eaab05e706e40977ae886d73e6bb05b')

build() {
    cd "$srcdir/django-statici18n-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-statici18n-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
