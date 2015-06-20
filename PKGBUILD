# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=zfec
pkgver=1.4.24
pkgrel=2
pkgdesc="A fast erasure codec which can be used with the command-line, C, Python, or Haskell"
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/zfec'
license=('GPL')
depends=('python2' 'pyutil' 'zbase32')
source=("https://pypi.python.org/packages/source/z/zfec/zfec-${pkgver}.tar.gz")
md5sums=('e1bca3a1f18374f72bdf8cd42ea9c919')

build(){
    cd "$srcdir/zfec-$pkgver"
    python2 setup.py build
}

check() {
    cd "$srcdir/zfec-$pkgver"
    python2 setup.py test
}

package(){
    cd "$srcdir/zfec-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
