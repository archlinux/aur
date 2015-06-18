# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Randy Heydon <randy.heydon at clockworklab dot net>

pkgname=xdot
_pkgname=${pkgname}.py
pkgver=0.6
pkgrel=3
pkgdesc="Interactive viewer for graphs written in Graphviz's dot language"
url="https://github.com/jrfonseca/xdot.py"
arch=('any')
license=('LGPL2.1')
depends=('graphviz' 'pygtk')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jrfonseca/${_pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('25dcb35aacdd58fb13519346d1d8cf500eeeeb3cc40dee85e967d23c52c0c37ba092a023aec6cd72a35b74e3ea6a2168e1691ad218e4a6af17ea6d56d824f05b')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -e 's/env python$/env python2/g' -i xdot.py
}

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# vim: ts=2 sw=2 et:
