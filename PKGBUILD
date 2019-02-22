# Maintainer: Joffrey <j-off@live.fr>

pkgname=('python2-django-constance' 'python-django-constance')
pkgbase='python-django-constance'
pkgver='2.3.1'
pkgrel=1
pkgdesc='Dynamic Django settings'
arch=('any')
url='https://github.com/jazzband/django-constance'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/jazzband/django-constance/archive/$pkgver.tar.gz")
sha256sums=('76ae5f98a35e94509c8cc69e02bc7dbe53899b28851d97a24655c0909f65a44f')

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
