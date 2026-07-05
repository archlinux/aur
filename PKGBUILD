# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-webpack-loader'
pkgver=3.2.4
pkgrel=1
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
sha256sums=('39ef8f0194a2b040aed305632168bf23a73f89319235d4f4ea6cadc1f097f2ea')

build() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
