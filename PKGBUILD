# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-user_agent
pkgname=('python-user_agent' 'python2-user_agent')
pkgver=0.1.0
pkgrel=1 
pkgdesc="User-Agent generator"
arch=('any')
url="https://pypi.python.org/pypi/user_agent"
license=('MIT')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/u/user_agent/user_agent-${pkgver}.tar.gz)
sha256sums=('486dcba313f2ef1b25e264cf550cad689a761169b912b0181ac71e0f2c3a0b88')

build() {
  cd $srcdir
  cp -r user_agent-$pkgver user_agent2-$pkgver
}

check() {
  cd $srcdir/user_agent-$pkgver 
  python3 setup.py check
  
  cd $srcdir/user_agent2-$pkgver 
  python2 setup.py check  
}

package_python-user_agent() {
  depends=('python' 'python-six')
  cd "$srcdir/user_agent-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-user_agent() {
  depends=('python2' 'python2-six')
  cd "$srcdir/user_agent2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
