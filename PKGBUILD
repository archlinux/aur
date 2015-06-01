# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=pyutil
pkgver=2.0.0
pkgrel=1
pkgdesc="general-purpose python library (used by tahoe-lafs)"
arch=('any')
url='http://pypi.python.org/pypi/pyutil'
license=('GPL2')
depends=('python2' 'python2-simplejson' 'zbase32' 'twisted')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/p/pyutil/pyutil-$pkgver.tar.gz")
md5sums=('025a06985691133479500139a3729909')

build(){
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build
    #python2 setup.py trial
}

package(){
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
    rm -r "$pkgdir/usr/pyutil"
}
