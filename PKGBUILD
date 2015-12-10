# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python2-ua-parser
pkgname=('python-ua-parser' 'python2-ua-parser')
pkgver=0.5.1
pkgrel=1 
pkgdesc="Python port of Browserscope's user agent parser"
arch=('any')
url="https://pypi.python.org/pypi/ua-parser"
license=('MIT')
makedepends=('python' 'python2')
source=("https://pypi.python.org/packages/source/u/ua-parser/ua-parser-${pkgver}.tar.gz")
sha256sums=('49414e54d98c0a1c4d1cbbbce228373d4d945f04f5621f0ea1fdc202930b1e20')

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

