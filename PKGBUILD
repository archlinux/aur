pkgname='python-entry'
pkgver=5.77b7517
pkgrel=1
pkgdesc='Do getopt with one decorator.'
arch=('any')
url='https://github.com/ewtoombs/python-entry'
license=("MIT")
depends=('python')
makedepends=('python-setuptools')
source=('git+https://github.com/ewtoombs/python-entry.git')
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
