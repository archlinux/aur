# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python2-user-agents
pkgname=('python-user-agents' 'python2-user-agents')
pkgver=1.1.0
pkgrel=1
pkgdesc="A library to identify devices (phones, tablets) and their capabilities by parsing (browser/HTTP) user agent strings"
arch=('any')
url="https://pypi.python.org/pypi/user-agents"
license=('MIT')
makedepends=('python' 'python2')
source=("https://pypi.python.org/packages/be/ff/886a1e2570784ee63b1c4b0fd77037b84087ffe7b7b45f9751285418be34/user-agents-${pkgver}.tar.gz")
sha256sums=('643d16772280052b546d956971d719989ef6dc9b17d9ff0386aa21391a038039')

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
  depends=('python' 'python-six' 'python-ua-parser')
  cd "$srcdir/user-agents-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-user-agents() {
  depends=('python2' 'python2-six' 'python2-ua-parser')
  cd "$srcdir/user-agents2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}