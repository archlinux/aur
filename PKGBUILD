# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python2-user-agents
pkgname=('python-user-agents' 'python2-user-agents')
pkgver=1.0.1
pkgrel=1
pkgdesc="A library to identify devices (phones, tablets) and their capabilities by parsing (browser/HTTP) user agent strings"
arch=('any')
url="https://pypi.python.org/pypi/user-agents"
license=('MIT')
makedepends=('python' 'python2')
source=("https://pypi.python.org/packages/source/u/user-agents/user-agents-${pkgver}.tar.gz")
sha256sums=('b5976d971e9e55ec8d80f6c6428f6de5de1467844a0d37184b5ee5e40929e939')

build() {
  cd $srcdir
  cp -r user-agents-$pkgver user-agents2-$pkgver
}

check() {
  cd $srcdir/user-agents-$pkgver 
  python3 setup.py check
  
  cd $srcdir/user-agents2-$pkgver 
  python2 setup.py check  
}

package_python-user-agents() {
  depends=('python' 'python-six')
  cd "$srcdir/user-agents-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-user-agents() {
  depends=('python2' 'python2-six')
  cd "$srcdir/user-agents2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

