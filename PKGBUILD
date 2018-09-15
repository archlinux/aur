# Maintainer: Joffrey <j-off@live.fr>

pkgname=('python2-django-constance' 'python-django-constance')
pkgbase='python-django-constance'
pkgver=2.3.0
pkgrel=1
pkgdesc='Dynamic Django settings'
arch=('any')
url='https://github.com/jazzband/django-constance'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/jazzband/django-constance/archive/$pkgver.tar.gz")
sha256sums=('2a2eab901cf8d1c40032759b5764504e44c0f84c70c3b014639263a6cbc31063')

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
