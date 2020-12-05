# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-django-constance
pkgver=2.8.0
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
sha256sums=('5de358f764f1dd99771d97a20b3e4525bd7574ef24e038691e8cbf1bfb085d59')

package() {
    cd "$srcdir/django-constance-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
