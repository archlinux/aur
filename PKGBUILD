# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-simple-captcha'
pkgver=0.6.3
pkgrel=1
pkgdesc='Django application to add captcha images to any Django form'
arch=('any')
url='https://github.com/mbi/django-simple-captcha'
license=('MIT')
depends=(
    'python-django'
    'python-six'
    'python-pillow'
    'python-django-ranged-response'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('86475ea14a8bb81731cd7d177484e0008f83bc0538284955fe59927804b8df7b')

build() {
    cd "$srcdir/django-simple-captcha-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-simple-captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
