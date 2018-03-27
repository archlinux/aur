# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=pyutil
pkgver=3.1.0
pkgrel=1
pkgdesc="general-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.python.org/pypi/pyutil'
license=('GPL2')
depends=('python2' 'python2-simplejson' 'zbase32' 'python2-twisted')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/54/16/11f89043cf7732fcc9493df558d2286c729a71efdd620dd744fdf659b4da/pyutil-${pkgver}.tar.gz")
md5sums=('a9ad3a8c87cadc56f2880a10e0e8219d')

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
