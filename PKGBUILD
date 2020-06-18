# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_pkgname=ua-parser
pkgname=python-ua-parser
pkgver=0.10.0
pkgrel=1
pkgdesc="Python port of Browserscope's user agent parser"
arch=('any')
url="https://pypi.python.org/pypi/ua-parser"
license=('MIT')
depends=('python' 'python-pyaml')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('47b1782ed130d890018d983fac37c2a80799d9e0b9c532e734c67cf70f185033')

#Tests only run from git resursive checkout
#check() {
  #cd $srcdir/${_pkgname}-$pkgver
  #PYTHONPATH=. python ua_parser/user_agent_parser_test.py
#}

build() {
  cd $srcdir/${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
