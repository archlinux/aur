# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-selection
pkgname=('python-selection' 'python2-selection')
pkgver=0.0.10
pkgrel=1 
pkgdesc="API to extract content from HTML & XML documents"
arch=('any')
url="https://pypi.python.org/pypi/selection"
license=('MIT')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/s/selection/selection-${pkgver}.tar.gz)
sha256sums=('efebb9518bb391a819a9d73753487271ac4e23dec70387770d6b2d686bc92c43')

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
