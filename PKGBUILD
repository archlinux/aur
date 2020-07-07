# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=python-user-agents
pkgver=2.1
_pkgver=${pkgver}.0
pkgrel=3
pkgdesc="A library to identify devices (phones, tablets) and their capabilities by parsing (browser/HTTP) user agent strings"
arch=('any')
url="https://pypi.python.org/pypi/user-agents"
depends=('python' 'python-pyaml' 'python-ua-parser')
license=('MIT')
source=("https://github.com/selwin/python-user-agents/archive/v${_pkgver}.tar.gz")
sha256sums=('4af5baf1205ea80604171c1aa66ada90d21ba20005b685ab388967c1a9bfb2a3')

build() {
  cd $srcdir/${pkgname}-$_pkgver
  python setup.py build
}

check() {
  cd $srcdir/${pkgname}-$_pkgver 
  PYHTONPATH=. python -m unittest
}

package() {
  cd "$srcdir/${pkgname}-$_pkgver"
  python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
