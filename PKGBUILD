# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-grab
pkgname=('python-grab' 'python2-grab')
pkgver=0.6.22
pkgrel=1 
pkgdesc="Web Scraping Framework"
arch=('any')
url="https://pypi.python.org/pypi/grab"
license=('MIT')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/g/grab/grab-${pkgver}.tar.gz)
sha256sums=('c2d754e8ed670ea3d709357d777d355fb58e5b45e34ef9356338c392ef343454')

build() {
  cd $srcdir
  cp -r grab-$pkgver grab2-$pkgver
}

check() {
  cd $srcdir/grab-$pkgver 
  python3 setup.py check
  
  cd $srcdir/grab2-$pkgver 
  python2 setup.py check  
}

package_python-grab() {
  depends=('python' 'python-pycurl' 'python-lxml' 'python-selection' 'python-six' 'python-weblib>=0.1.10')
  cd "$srcdir/grab-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-grab() {
  depends=('python2' 'python2-pycurl' 'python2-lxml' 'python2-selection' 'python2-six' 'python2-weblib>=0.1.10')
  cd "$srcdir/grab2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
