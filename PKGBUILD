# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-daemon
pkgver=2.0.5
pkgrel=1
pkgdesc="Library to implement a well-behaved Unix daemon process"
arch=('any')
depends=('python2' 'python2-docutils' 'python2-lockfile')
makedepends=('python2-setuptools')
url="https://alioth.debian.org/projects/python-daemon"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('73e7f49f525c51fa4a995aea4d80de41')
sha256sums=('afde4fa433d94d007206ee31a0941d55b5eb232a5422b670aad628547b46bf68')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
