# Maintainer: Joffrey <j-off@live.fr>

pkgbase='python-cas'
pkgname=('python-cas' 'python2-cas')
pkgver='1.4.0'
pkgrel=1
pkgdesc='Python utilities to implement CAS protocol (Central Authentication Service)'
arch=('any')
url='https://github.com/python-cas/python-cas'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/python-cas/python-cas/archive/v$pkgver.tar.gz")
sha256sums=('f7073688804975c06dbffb41faf054da7e472b62b843ac1a6c9135797c446ccf')

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
