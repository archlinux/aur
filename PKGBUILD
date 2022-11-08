pkgname='fastpipe'
pkgver=2.6d633bc
pkgrel=1
pkgdesc='UNIX pipelines for python.'
arch=('any')
url='https://sr.ht/~ewtoombs/fastpipe/'
license=("MIT")
depends=('python')
makedepends=('python-setuptools')
source=('git+https://git.sr.ht/~ewtoombs/fastpipe/')
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
