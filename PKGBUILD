# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=pyliblzma
pkgname=python2-${_relname}
pkgver=0.5.3
pkgrel=7
pkgdesc='Python 2 bindings for liblzma'
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pyliblzma'
license=('LGPL3')
depends=('python2' 'xz')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/p/${_relname}/${_relname}-${pkgver}.tar.bz2)
sha256sums=('08d762f36d5e59fb9bb0e22e000c300b21f97e35b713321ee504cfb442667957')
sha512sums=('272983aac426e86d6d636ccba4fe78a07d7282560081df937114162bfd317bd8023814693b8d473d0f7884e38a968ebeaf8f954a5a27c1f7e5da084f3fd05c65')

prepare() {
  cd ${_relname}-${pkgver}
  sed -e 's/env python$/env python2/g' -i liblzma.py
}

build() {
  cd ${_relname}-${pkgver}
  python2 setup.py build
}

check() {
  cd ${_relname}-${pkgver}
  python2 setup.py test
}

package() {
  cd ${_relname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# vim:ts=2:sw=2:et:
