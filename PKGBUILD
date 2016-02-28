# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=python-llfuse
pkgver=0.43
pkgrel=1
pkgdesc="A set of Python bindings for the low level FUSE API."
arch=('armv7h' 'i686' 'x86_64')
url="https://bitbucket.org/nikratio/python-llfuse/"
license=('LGPL3')
depends=('python' 'python-setuptools' 'fuse')
makedepends=('pkg-config')
options=(!emptydirs)
source=(https://bitbucket.org/nikratio/python-llfuse/downloads/llfuse-${pkgver}.tar.bz2)
md5sums=('f3d92839eecc567daa35028a92b7da71')

build() {
  cd ${srcdir}/llfuse-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/llfuse-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
