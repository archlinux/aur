# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-cas
pkgver=1.5.0
pkgrel=2
pkgdesc='Python utilities to implement Central Authentication Service protocol'
arch=('any')
url='https://github.com/python-cas/python-cas'
license=('MIT')
depends=(
    'python-six'
    'python-requests'
    'python-lxml'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b5e2e8b9625aeabfb4d3884db1d264e1f58dcf0b506bdb2ab245f62cdb6c0b0a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
