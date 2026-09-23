# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-statici18n'
pkgver=2.8.0
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
sha256sums=('329828a49eab2c434fe4fd1bcbfd0ae970eef8bb8056b70d7ffc3b46d399be04')

build() {
    cd "$srcdir/django-statici18n-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-statici18n-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
