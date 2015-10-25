# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-weblib
pkgname=('python-weblib' 'python2-weblib')
pkgver=0.1.20
pkgrel=1 
pkgdesc="Set of tools for web scraping projects"
arch=('any')
url="https://pypi.python.org/pypi/weblib"
license=('MIT')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/w/weblib/weblib-${pkgver}.tar.gz)
sha256sums=('d49687b97ecb61cb7ab4df947f1f0b084a3514476fa910a9d3b554876e05bdbb')

build() {
  cd $srcdir
  cp -r weblib-$pkgver weblib2-$pkgver
}

check() {
  cd $srcdir/weblib-$pkgver 
  python3 setup.py check
  
  cd $srcdir/weblib2-$pkgver 
  python2 setup.py check  
}

package_python-weblib() {
  depends=('python' 'python-lxml' 'python-six' 'python-pytils')
  cd "$srcdir/weblib-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-weblib() {
  depends=('python2' 'python2-lxml' 'python2-six' 'python2-pytils')
  cd "$srcdir/weblib2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
