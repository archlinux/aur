# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=zfec
pkgver=1.5.3
pkgrel=1
pkgdesc="A fast erasure codec which can be used with the command-line, C, Python, or Haskell"
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/zfec'
license=('GPL')
depends=('python2>=2.7.16' 'pyutil')
source=("https://files.pythonhosted.org/packages/source/z/zfec/zfec-${pkgver}.tar.gz")
sha256sums=('b41bd4b0af9c6b3a78bd6734e1e4511475944164375e6241b53df518a366922b')

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
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
