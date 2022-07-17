# Maintainer: Franck Hochstaetter <dasfranck@gmx.com>

pkgname=piqueserver-git
_pkgname=piqueserver
pkgver="v0.1.3.r601.gb10c3819"
pkgrel=1
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
            'python-pycryptodome: ssh'
            'python-pyasn1: ssh')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/piqueserver/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
