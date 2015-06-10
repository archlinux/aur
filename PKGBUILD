# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=spread-python2
pkgver=1.5spread4
pkgrel=4
pkgdesc="Python2 bindings for the spread toolkit"
arch=('x86_64' 'i386')
url='http://www.spread.org'
license=('PSF')
depends=('python2' 'spread-daemon')
makedepends=('setuptools')
source=("http://www.spread.org/files/SpreadModule-${pkgver}.tgz")
md5sums=('28c0da7a0658c2f13aa5596b2953d7ad')

build() {
    cd ${srcdir}/SpreadModule-${pkgver}
    python2 setup.py build || return 1
}

package() {
    cd ${srcdir}/SpreadModule-${pkgver}
    python2 setup.py install --root=${pkgdir} || return 1
}
