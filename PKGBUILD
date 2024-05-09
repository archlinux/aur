# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-statici18n'
pkgver=2.3.1
pkgrel=2
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
sha256sums=('e2dc1f47d68ff2721dd68fd33195fac9450d2f733c8d6fd1d0d515f066ddcf60')

build() {
    cd "$srcdir/django-statici18n-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-statici18n-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
