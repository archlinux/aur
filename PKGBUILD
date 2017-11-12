# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python2-ua-parser
pkgname=('python-ua-parser' 'python2-ua-parser')
pkgver=0.7.3
pkgrel=1 
pkgdesc="Python port of Browserscope's user agent parser"
arch=('any')
url="https://pypi.python.org/pypi/ua-parser"
license=('MIT')
makedepends=('python' 'python2' 'libyaml')
source=("https://pypi.python.org/packages/a3/b4/3d31176d3cb2807635175004e0381fb72351173ec8c9c043b80399cf33a6/ua-parser-${pkgver}.tar.gz")
sha256sums=('0aafb05a67b621eb4d69f6c1c3972f2d9443982bcd9132a8b665d90cd48a1add')

build() {
  cd $srcdir
  cp -r ua-parser-$pkgver ua-parser2-$pkgver
}

check() {
  cd $srcdir/ua-parser-$pkgver 
  python3 setup.py check
  
  cd $srcdir/ua-parser2-$pkgver 
  python2 setup.py check  
}

package_python-ua-parser() {
  depends=('python' 'python-six')
  cd "$srcdir/ua-parser-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-ua-parser() {
  depends=('python2' 'python2-six')
  cd "$srcdir/ua-parser2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

