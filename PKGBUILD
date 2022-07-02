# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_pkgname=ua-parser
pkgname=python-ua-parser
pkgver=0.15.0
pkgrel=1
pkgdesc="Python port of Browserscope's user agent parser"
arch=('any')
url="https://pypi.python.org/pypi/ua-parser"
license=('MIT')
depends=('python' 'python-pyaml')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e441c982ffe81aa7e31af40ac6bf1d39f8ad24f1d34a2d91baae415470b26e9b')

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
