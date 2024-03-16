# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=python-openems-git
pkgver=v0.0.36.r15.g1ccf094
pkgrel=1
pkgdesc="a free and open source EC-FDTD solver"
url="https://github.com/thliebig/openEMS"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openems' 'python-csxcad')
makedepends=('cython' 'python-setuptools')
provides=('python-openems')
conflicts=('python-openems')

source=(git+https://github.com/thliebig/openEMS)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/openEMS"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/openEMS/python"
  python setup.py build
}

package() {
  cd "$srcdir/openEMS/python"
  python setup.py install --root=${pkgdir}
}
