# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_pkgname=ua-parser
pkgname=python2-ua-parser
pkgver=0.7.3
pkgrel=1
pkgdesc="Python port of Browserscope's user agent parser"
arch=('any')
url="https://pypi.python.org/pypi/ua-parser"
license=('MIT')
depends=('python2' 'python2-six' 'libyaml' 'python2-setuptools')
source=("https://pypi.python.org/packages/a3/b4/3d31176d3cb2807635175004e0381fb72351173ec8c9c043b80399cf33a6/ua-parser-0.7.3.tar.gz")
sha256sums=('0aafb05a67b621eb4d69f6c1c3972f2d9443982bcd9132a8b665d90cd48a1add')

#Tests only run from git resursive checkout
#check() {
  #cd $srcdir/${_pkgname}-$pkgver
  #PYTHONPATH=. python ua_parser/user_agent_parser_test.py
#}

build() {
  cd $srcdir/${_pkgname}-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
