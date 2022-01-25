# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-simple-captcha'
pkgver=0.5.14
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
sha256sums=('c3464574209ada36915776e7c9024fa40ab1e7731748dc135e0821558c736a3d')

package() {
    cd "$srcdir/django-simple-captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
