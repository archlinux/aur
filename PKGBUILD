# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-webpack-loader'
pkgver=0.6.0
pkgrel=3
pkgdesc='Transparently use webpack with django'
arch=('any')
url='https://github.com/owais/django-webpack-loader'
license=('MIT')
depends=(
    'python-django'
    'python-lxml'
    'python-six'
    'python-requests'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5859d1794a08a02d2453b29a4a5c847bb2e16e415c4b9b13979f7cd90e209005')

package() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
