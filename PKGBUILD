# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-webpack-loader'
pkgver=0.7.0
pkgrel=1
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
sha256sums=('fef6b13bbd61d682e12f3bd73bb7ac1c398dd0dea22ef2cf34309c6d1078b0d1')

package() {
    cd "$srcdir/django-webpack-loader-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
