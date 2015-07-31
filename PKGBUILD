# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=pyutil
pkgver=2.0.0
pkgrel=1
pkgdesc="general-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.python.org/pypi/pyutil'
license=('GPL2')
depends=('python2' 'python2-simplejson' 'zbase32' 'twisted')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pyutil/pyutil-${pkgver}.tar.gz")
md5sums=('025a06985691133479500139a3729909')

build(){
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py build
}

BUILDENV+=(!check)
check() {
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py test
}

package(){
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
    rm -r "$pkgdir/usr/pyutil"
}
