# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=python-csxcad-git
pkgver=v0.6.3.r2.gc6a1587
pkgrel=1
pkgdesc="A C++ library to describe geometrical objects and their physical or non-physical properties."
url="https://github.com/thliebig/CSXCAD"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('csxcad')
makedepends=('cython' 'python-setuptools')
provides=('python-csxcad')
conflicts=('python-csxcad')

source=(git+https://github.com/thliebig/CSXCAD)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/CSXCAD"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/CSXCAD/python"
  python setup.py build
}

package() {
  cd "$srcdir/CSXCAD/python"
  python setup.py install --root=${pkgdir}
}
