# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-statici18n'
pkgver=2.5.0
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
sha256sums=('b1f5625efed88997112dc27b92b473ecddcc89acc99bf8c31ce2f79784a4a432')

build() {
    cd "$srcdir/django-statici18n-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-statici18n-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
