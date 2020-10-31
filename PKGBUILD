# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-simple-captcha'
pkgver=0.5.13
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
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2b5ed32a8808c8fe2001aa7ebe13d5b25d36f304566a71f8cc1c2cdcf0057039')

package() {
    cd "$srcdir/django-simple-captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
