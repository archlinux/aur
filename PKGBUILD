# Maintainer: Joffrey <j-off@live.fr>

pkgbase='python-cas'
pkgname=('python-cas' 'python2-cas')
pkgver=1.5.0
pkgrel=1
pkgdesc='Python utilities to implement Central Authentication Service protocol'
arch=('any')
url='https://github.com/python-cas/python-cas'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b5e2e8b9625aeabfb4d3884db1d264e1f58dcf0b506bdb2ab245f62cdb6c0b0a')

package_python-cas() {
    depends=(
        'python-six'
        'python-requests'
        'python-lxml'
    )
    cd "$srcdir/python-cas-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

package_python2-cas() {
    depends=(
        'python2-six'
        'python2-requests'
        'python2-lxml'
    )
    cd "$srcdir/python-cas-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 './setup.py' install --root="$pkgdir" --optimize=1
}
