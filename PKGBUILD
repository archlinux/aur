# Maintainer: Joffrey <j-off@live.fr>

pkgbase='python-django-simple-captcha'
pkgname=('python-django-simple-captcha' 'python2-django-simple-captcha')
pkgver='0.5.7'
pkgrel=1
pkgdesc='Django application to add captcha images to any Django form'
arch=('any')
url='https://github.com/mbi/django-simple-captcha'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/mbi/django-simple-captcha/archive/v$pkgver.tar.gz")
sha256sums=('784a27dc8bfec5cafe9adc65cc89d12286430c3a9b456c6f0b2e18ffcf892648')

package_python-django-simple-captcha() {
    depends=(
        'python-django'
        'python-six'
        'python-pillow'
        'python-django-ranged-response'
    )
    cd "$srcdir/django-simple-captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

package_python2-django-simple-captcha() {
    depends=(
        'python2-django'
        'python2-six'
        'python2-pillow'
        'python2-django-ranged-response'
    )
    cd "$srcdir/django-simple-captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 './setup.py' install --root="$pkgdir" --optimize=1
}
