# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-selection
pkgname=('python-selection' 'python2-selection')
pkgver=0.0.11
pkgrel=1 
pkgdesc="API to extract content from HTML & XML documents"
arch=('any')
url="https://pypi.python.org/pypi/selection"
license=('MIT')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/s/selection/selection-${pkgver}.tar.gz)
sha256sums=('3e2f5b21bda0c6a877ca42f23f017cb2e95873155fa10ae3ae44520280a9e819')

build() {
  cd $srcdir
  cp -r selection-$pkgver selection2-$pkgver
}

check() {
  cd $srcdir/selection-$pkgver 
  python3 setup.py check
  
  cd $srcdir/selection2-$pkgver 
  python2 setup.py check  
}

package_python-selection() {
  depends=('python' 'python-lxml' 'python-six' 'python-weblib')
  cd "$srcdir/selection-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-selection() {
  depends=('python2' 'python2-lxml' 'python2-six' 'python2-weblib')
  cd "$srcdir/selection2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
