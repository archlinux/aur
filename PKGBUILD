# Maintainer: Sebastian Weiss <dl3yc@darc.de>

pkgname=python-pyems-git
pkgver=b5cac87
pkgrel=1
pkgdesc="High-level python interface to OpenEMS with automatic mesh generation"
url="https://github.com/matthuszagh/pyems"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openems' 'python-csxcad' 'python-openems' 'python-h5py')
provides=('python-pyems')
conflicts=('python-pyems')

source=(git+https://github.com/matthuszagh/pyems)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pyems"
  git describe --always --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/pyems"
  python setup.py build
}

package() {
  cd "$srcdir/pyems"
  python setup.py install --root=${pkgdir}
}
