# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-cas
pkgver=1.6.0
pkgrel=1
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
sha256sums=('c30918c147e8b2ee43ec13c942391f868ed81d197353db49a160187afcbd2fda')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
