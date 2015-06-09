# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python2-scrypt
pkgver=0.6.1
pkgrel=1
pkgdesc="Bindings for the scrypt key derivation function library"
arch=('i686' 'x86_64')
depends=('python2' 'scrypt')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/scrypt"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('1af78108db9f3bd189b0d78f7eb4382d')
sha256sums=('6142bb9f786649bd2a51f47e61dff91bf8315fd8989188003c3c61c05834a07b')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
