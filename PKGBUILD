pkgbase=pywbem
pkgname=('python-pywbem'
         'python2-pywbem')
pkgver=0.9.0
pkgrel=1
pkgdesc="Python WBEM Client and Provider Interface"
arch=('any')
url='https://github.com/pywbem/pywbem'
license=('LGPLv2.1+')
depends=('python3' 'python-pip' 'python2' 'python2-pip')
source=("https://github.com/$pkgbase/$pkgbase/archive/v${pkgver}.tar.gz")
sha256sums=('e5a38cfffceca2bb984a531b17837c5d6a89cdbdedf08a527712bc365f19f2bb')

build() {
    :
}

package_python-pywbem() {
    cd $srcdir/$pkgbase-${pkgver}
    python3 setup.py build || return 1
    python3 setup.py install --root=$pkgdir || return 1
    rm -fv $pkgdir/usr/bin/*.bat
}

package_python2-pywbem() {
    cd $srcdir/$pkgbase-${pkgver}
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
    rm -rf $pkgdir/usr/bin
}
