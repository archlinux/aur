# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-webpack-loader'
pkgver=3.0.0
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
sha256sums=('5e7548800720c1ae47982697c19e8b06f7c783c35d4f6b5793c4d049e138ce9b')

package() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
