# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=zfec
pkgver=1.5.2
pkgrel=1
pkgdesc="A fast erasure codec which can be used with the command-line, C, Python, or Haskell"
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/zfec'
license=('GPL')
depends=('python2' 'pyutil' 'zbase32')
source=("https://pypi.python.org/packages/50/b4/a9b28e4e29df58f73198ed7248dc93f3bb743e8f9a86ac61cb32c44a699c/zfec-${pkgver}.tar.gz")
md5sums=('4c7f532010aebaa3b1728414f82c5109')

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
