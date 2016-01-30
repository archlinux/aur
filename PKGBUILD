# $Id$
# Maintainer: philou <philou at mailz dot org>

pkgname=python-whatportis
pkgver=0.4
pkgrel=1
pkgdesc="A Python command to search port names and numbers"
arch=('any')
makedepends=('python-setuptools')
url="https://github.com/ncrocfer/whatportis"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/w/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('cf825d8289f367936f2dfb8682b39bdf')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  depends=('python-click>=6.2' 'python-prettytable>=0.7.2')	
	
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
