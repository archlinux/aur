# Maintainer: Samuel Walladge <samuel@swalladge.id.au>

pkgname=piqueserver-git
_pkgname=piqueserver
pkgver=v0.1.3.r534.gd0ee6456
pkgrel=1
pkgdesc="an Ace of Spades 0.75 server based on PySnip"
arch=('any')
url="https://github.com/piqueserver/${_pkgname}"
license=('GPL3')
depends=('cython2' 'python2-twisted' 'python2-jinja' 'python2-pillow' 'python2-zope-interface')
optdepends=('python2-geoip: to use the "from" command'
            'python2-crypto: ssh'
            'python2-pyasn1: ssh')
makedepends=('git')
source=("${pkgname}"::"git://github.com/piqueserver/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
