# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-grab
pkgver=0.6.20
pkgrel=1
pkgdesc="Grab - Web Scraping Framework"
arch=('any')
url="http://github.com/lorien/grab"
license=('MIT')
depends=('python2' 'python2-pycurl' 'python2-lxml' 'python2-cssselect')
source=(https://pypi.python.org/packages/source/g/grab/grab-${pkgver}.tar.gz)
sha256sums=('4c40ca059d00df5e4b68ca52e5d0e6796ca8f9d00577568dcc25d857d8565bab')

build() {
  cd "$srcdir/grab-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/grab-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
