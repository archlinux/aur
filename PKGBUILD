# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-webpack-loader'
pkgver=3.1.0
pkgrel=2
pkgdesc='Transparently use webpack with django'
arch=('any')
url='https://github.com/django-webpack/django-webpack-loader'
license=('MIT')
depends=(
    'python-django'
    'python-lxml'
    'python-six'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d920dd8624a3db299b0a891f51a7cc48a17514ea78b6bd606c11c509ae3fcbeb')

build() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
