# Maintainer : M0Rf30 <morf3089@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkg=pjproject
pkgname=python2-$_pkg
pkgver=2.2.1
pkgrel=1
pkgdesc="Open source SIP stack and media stack (also known as pjsip)"
arch=('i686' 'x86_64')
url="http://www.pjsip.org/"
license=('GPL')
depends=('pjproject' 'python2')
makedepends=('python2-distribute')
source=("http://www.pjsip.org/release/$pkgver/pjproject-$pkgver.tar.bz2")

build() {
   cd "$srcdir/$_pkg-$pkgver"
 
# Build python module
  cd pjsip-apps/src/python/
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  cd pjsip-apps/src/python/
  python2 setup.py install --root="$pkgdir"
}

md5sums=('6ed4bb7750c827dc1d881e209a3b62db')
