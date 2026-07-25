pkgname='python-calc'
pkgver=28.b407b4b
pkgrel=1
pkgdesc='A minimalist scientific calculator for python.'
arch=('any')
url='https://git.sr.ht/~ewtoombs/python-calc'
license=("MIT")
depends=('python')
makedepends=('python-setuptools')
source=('git+https://git.sr.ht/~ewtoombs/python-calc')
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
