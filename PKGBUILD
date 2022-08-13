# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-django-constance
pkgver=2.9.1
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
sha256sums=('be021529f825d82c672a8773a44d3b04d17b1dbf35e7abf1675dd948048e448d')

package() {
    cd "$srcdir/django-constance-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
