# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=python-user-agents
pkgver=2.2.0
pkgrel=1
pkgdesc="A library to identify devices (phones, tablets) and their capabilities by parsing (browser/HTTP) user agent strings"
arch=('any')
url="https://pypi.python.org/pypi/user-agents"
depends=('python' 'python-pyaml' 'python-ua-parser')
license=('MIT')
source=("https://github.com/selwin/python-user-agents/archive/v${pkgver}.tar.gz")
sha256sums=('25ad850fe9cfc8e0e2a8e6b054943006b33317e34a36c6c9996a2f489acff879')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd $srcdir/${pkgname}-${pkgver}
  PYHTONPATH=. python -m unittest
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
