# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python2-user-agents
pkgname=('python-user-agents' 'python2-user-agents')
pkgver=2.1
pkgrel=1
pkgdesc="A library to identify devices (phones, tablets) and their capabilities by parsing (browser/HTTP) user agent strings"
arch=('any')
url="https://pypi.python.org/pypi/user-agents"
license=('MIT')
makedepends=('python' 'python2')
source=("https://files.pythonhosted.org/packages/1b/be/82e4d20a7716d8e5de98b948edcecff9bb237e6718c3831bd92794fe9821/user-agents-${pkgver}.tar.gz")
sha256sums=('da54371d856c35d8ead0622da24ad5ef6d667eda3629a750e3373a3e847a054b')

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
