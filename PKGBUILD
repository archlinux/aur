# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-daemon
pkgver=2.1.0
pkgrel=1
pkgdesc="Library to implement a well-behaved Unix daemon process"
arch=('any')
depends=('python2' 'python2-docutils' 'python2-lockfile')
makedepends=('python2-setuptools')
url="https://alioth.debian.org/projects/python-daemon"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('f474f94eccc544968a36430f88a70c15')
sha256sums=('ae30f6d4d7399665317f90d986686cf455a1b3e61e3c042cc00a39a34e3b4825')

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
