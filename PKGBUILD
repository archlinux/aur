pkgname='python-calc'
pkgver=27.6fa2bae
pkgrel=1
pkgdesc='A minimalist scientific calculator for python.'
arch=('any')
url='https://codeberg.org/triteraflops/python-calc'
license=("MIT")
depends=('python')
makedepends=('python-setuptools')
source=('git+https://codeberg.org/triteraflops/python-calc.git')
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
