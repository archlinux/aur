# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_pkgname=ua-parser
pkgname=python-ua-parser
pkgver=0.16.1
pkgrel=1
pkgdesc="Python port of Browserscope's user agent parser"
arch=('any')
url="https://pypi.python.org/pypi/ua-parser"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=('python' 'python-pyaml')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ed3efc695f475ffe56248c9789b3016247e9c20e3556cfa4d5aadc78ab4b26c6')

#Tests only run from git resursive checkout
#check() {
  #cd $srcdir/${_pkgname}-$pkgver
  #PYTHONPATH=. python ua_parser/user_agent_parser_test.py
#}

build() {
  cd $srcdir/${_pkgname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
