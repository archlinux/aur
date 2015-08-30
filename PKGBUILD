# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-daemon
pkgver=2.0.6
pkgrel=1
pkgdesc="Library to implement a well-behaved Unix daemon process"
arch=('any')
depends=('python2' 'python2-docutils' 'python2-lockfile')
makedepends=('python2-setuptools')
url="https://alioth.debian.org/projects/python-daemon"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('049508c47c8fa054e91ec9a3c572f939')
sha256sums=('1730b8e80773379857bf4a792ccccea2cda05c151fbee986b909ceddafa27309')

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
