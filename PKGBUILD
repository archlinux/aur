# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-statici18n'
pkgver=2.0.0
pkgrel=1
pkgdesc='A Django app that provides helper for generating JavaScript catalog to static files'
arch=('any')
url='https://github.com/zyegfryed/django-statici18n'
license=('BSD')
depends=(
    'python-django'
    'python-django-appconf'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e2f3cdb3a43ff92d47d1dfc018bbf2d1d77df4a27def6d7982ba724bdec0d059')

package() {
    cd "$srcdir/django-statici18n-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
