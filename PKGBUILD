# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-pytils
pkgname=python-pytils
pkgver=0.3
pkgrel=1 
pkgdesc="Russian-specific string utils"
arch=('any')
url="https://pypi.python.org/pypi/pytils/"
license=('MIT')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/p/pytils/pytils-${pkgver}.tar.gz)
sha256sums=('1e85118d095d48928fef1a73e3e1dccdbc07bc931131705976b7dd05b66627fc')

build() {
  cd $srcdir
  cp -r pytils-$pkgver pytils2-$pkgver
}

check() {
  cd $srcdir/pytils-$pkgver 
  python3 setup.py check
  
  cd $srcdir/pytils2-$pkgver 
  python2 setup.py check  
}

package_python-pytils() {
  depends=('python')
  cd "$srcdir/pytils-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-pytils() {
  depends=('python2')
  cd "$srcdir/pytils2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
