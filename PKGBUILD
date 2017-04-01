pkgname='python-calc'
pkgver=20170331.4.28960fa
pkgrel=1
pkgdesc='A minimalist scientific calculator for python.'
arch=('any')
url='https://github.com/ewtoombs/python-calc'
license=("MIT")
makedepends=('python')
source=('git+https://github.com/ewtoombs/python-calc.git')
md5sums=('SKIP')

pkgver () {
    _date="$(date '+%Y%m%d')"
	cd "$srcdir/$pkgname"
	echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

package () {
    cd "$srcdir/$pkgname"

    python setup.py install --root="$pkgdir/"

    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
