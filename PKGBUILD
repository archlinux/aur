# Maintainer: Samuel Walladge <samuel@swalladge.id.au>

pkgname=piqueserver-git
_pkgname=piqueserver
pkgver=v0.1.3.r534.gd0ee6456
pkgrel=3
pkgdesc="an Ace of Spades 0.75 server based on PySnip"
arch=('any')
url="https://github.com/piqueserver/${_pkgname}"
license=('GPL3')
depends=(
  'cython'
  'python-aiohttp'
  'python-jinja'
  'python-pillow'
  'python-pyenet-piqueserver-git'
  'python-setuptools'
  'python-service-identity'
  'python-toml'
  'python-twisted'
  'python-zope-interface'
)
optdepends=('python-geoip: to use the "from" command'
            'python-crypto: ssh'
            'python-pyasn1: ssh')
makedepends=('git')
source=("${pkgname}"::"git://github.com/piqueserver/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
