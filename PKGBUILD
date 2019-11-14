# Maintainer: Joffrey <j-off@live.fr>

pkgname=('python2-django-constance' 'python-django-constance')
pkgbase='python-django-constance'
pkgver='2.4.0'
pkgrel=2
pkgdesc='Dynamic Django settings'
arch=('any')
url='https://github.com/jazzband/django-constance'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('29e81a2b97a660aa08212029ae664da054cb9c83763ce35b2c959b0b0414202b')

package_python-django-constance() {
    depends=('python-django')
    optdepends=(
        'python-django-picklefield: Database support'
        'python-redis: Redis support'
    )
    cd "$srcdir/django-constance-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

package_python2-django-constance() {
    depends=('python2-django')
    optdepends=(
        'python2-django-picklefield: Database support'
        'python2-redis: Redis support'
    )
    cd "$srcdir/django-constance-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 './setup.py' install --root="$pkgdir" --optimize=1
}
