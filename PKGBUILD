_pkgname='python-binance'
pkgname="$_pkgname-git"
_majmin='0.6.2'
pkgver=0.6.2.23edd7b
pkgrel=1
pkgdesc="A simple python interface to binance.com's web API."
arch=('any')
url='https://github.com/ewtoombs/python-binance'
license=('MIT')
depends=('python' 'python-requests' 'python-autobahn' 'python-service-identity')
makedepends=('python-setuptools')
source=('git+https://github.com/ewtoombs/python-binance.git')
md5sums=('SKIP')

pkgver () {
    #_date="$(date '+%Y%m%d')"
	cd "$srcdir/$_pkgname"
	echo "$_majmin.$(git rev-parse --short master)"
}

package () {
    cd "$srcdir/$_pkgname"

    python setup.py install --root="$pkgdir/"

    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
