# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.6.7
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2' 'python2-cffi')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('cd67c0e1e5af1acf7c1d1d967587dd27')
sha256sums=('e2d419a50596e38dfa6688caafa08c33bdb3a1b3589537f30f3fbe085148b7b7')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
