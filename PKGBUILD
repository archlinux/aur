# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=python-llfuse
pkgver=0.41.1
pkgrel=1
pkgdesc="A set of Python bindings for the low level FUSE API."
arch=('i686' 'x86_64')
url="https://bitbucket.org/nikratio/python-llfuse/"
license=('LGPL3')
depends=('python' 'python-setuptools' 'fuse')
makedepends=('pkg-config')
options=(!emptydirs)
source=(https://bitbucket.org/nikratio/python-llfuse/downloads/llfuse-${pkgver}.tar.bz2)
md5sums=('89496c1c6b9a4c3cc9a46c3cd6506433')

build() {
  cd ${srcdir}/llfuse-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/llfuse-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
