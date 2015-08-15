# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-weblib
pkgname=('python-weblib' 'python2-weblib')
pkgver=0.1.15
pkgrel=1 
pkgdesc="Set of tools for web scraping projects"
arch=('any')
url="https://pypi.python.org/pypi/weblib"
license=('MIT')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/w/weblib/weblib-${pkgver}.tar.gz)
sha256sums=('f62e84fe1b378274ff06e518f42bc79c53182ab00581b891482f301e7206a86c')

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
