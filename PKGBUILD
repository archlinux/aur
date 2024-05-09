# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname='python-django-pylibmc'
pkgver=0.6.1
pkgrel=4
pkgdesc='Memcached cache backend for Django using pylibmc'
arch=('any')
url='https://github.com/django-pylibmc/django-pylibmc'
license=('BSD')
depends=('python-pylibmc')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e0c37aaad086e8e9ec987ea35a75107b0375d924c24136e5f56995a916c54b1a')

build() {
    cd "$srcdir/django-pylibmc-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-pylibmc-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
