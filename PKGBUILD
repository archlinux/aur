# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=snitun
pkgname=python-snitun
pkgver=0.34.0
pkgrel=1
pkgdesc='End-to-End encryption with SNI proxy on top of a TCP multiplexer'
url='https://pypi.org/project/snitun'
arch=('any')
license=('GPL-3.0')
depends=('python-attrs' 'python-async-timeout' 'python-cryptography')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-pytest-aiohttp'
              'python-black' 'python-pip' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/NabuCasa/snitun/archive/${pkgver}.tar.gz")
sha256sums=('6310cedcf0f8ec8ec0a27c472f3e16a7bf923cc9439f579146173e85baf2ded8')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
