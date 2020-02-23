# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-constance'
pkgver=2.6.0
pkgrel=1
pkgdesc='Dynamic Django settings'
arch=('any')
url='https://github.com/jazzband/django-constance'
license=('BSD')
depends=('python-django')
makedepends=('python-setuptools')
optdepends=(
    'python-django-picklefield: Database support'
    'python-redis: Redis support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c68091e74475cbfb2d67adeebe8cc028b04cf37588c4993c0972df63b8b507dd')

package() {
    cd "$srcdir/django-constance-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
