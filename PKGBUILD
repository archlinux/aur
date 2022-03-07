pkgname='python-devrandom'
pkgver=3.b253746
pkgrel=1
pkgdesc="/dev/random support for python's 'random' module."
arch=('any')
url='https://gitlab.com/ewtoombs/python-devrandom'
license=("MIT")
depends=('python')
makedepends=('python-setuptools')
source=('git+https://gitlab.com/ewtoombs/python-devrandom.git')
md5sums=('SKIP')

pkgver () {
    #_date="$(date '+%Y%m%d')"
    cd "$srcdir/$pkgname"
    echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

package () {
    cd "$srcdir/$pkgname"

    python setup.py install --root="$pkgdir/"

    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
