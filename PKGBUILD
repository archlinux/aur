# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-webpack-loader'
pkgver=1.0.0
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
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9d530da4b558cb285bd0271786e80a76d5df0a1b26ef363a24428c3700428d72')

package() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
