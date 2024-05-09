# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-simple-captcha'
pkgver=0.6.0
pkgrel=2
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
sha256sums=('0b798d7572df98330c9975cd343a229b787d30bf9fdb8b852b307b5073af0ed0')

build() {
    cd "$srcdir/django-simple-captcha-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-simple-captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
