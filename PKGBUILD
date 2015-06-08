# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-modargs
pkgver=1.7
pkgrel=1
pkgdesc="modargs is a simple command line argument parsing library that infers arguments from functions in a module"
url="http://pypi.python.org/pypi/python-modargs"
depends=('python2' )
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/p/python-modargs/python-modargs-$pkgver.tar.gz"
        "LICENSE::https://gitorious.org/python-modargs/python-modargs/raw/93dfa839144f77d9422091acaa835d3a72c69060:LICENSE")
sha1sums=('ace9bb2af4d6f62501792a3bc0fc39e60df02e2b'
          '7fffa2cb5532406c2c9f5dc54709475b7244cf85')

build() {
  cd $srcdir/python-modargs-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/python-modargs-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 
  install -Dm644 $srcdir/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
