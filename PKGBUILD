# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=python2-llfuse
pkgver=0.41
pkgrel=1
pkgdesc="A set of Python bindings for the low level FUSE API."
arch=('i686' 'x86_64')
url="https://bitbucket.org/nikratio/python-llfuse/"
license=('LGPL3')
depends=('python2' 'python2-setuptools' 'fuse')
makedepends=('pkg-config')
options=(!emptydirs)
source=(https://bitbucket.org/nikratio/python-llfuse/downloads/llfuse-${pkgver}.tar.bz2)
md5sums=('18ecb7c0126b85cd186f2a2ac4a7761d')

build() {
  cd ${srcdir}/llfuse-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/llfuse-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
